import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../cubits/accountpage/account_cubit.dart';
import '../../cubits/profileimage/profileimage_cubit.dart';
import '../../cubits/profilepage/profile_cubit.dart';
import '../../models/account_model.dart';
import '../../providers/userdata_provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(
      {Key key, @required this.profileDetails, @required this.accountCubit})
      : super(key: key);

  final AccountCubit accountCubit;
  final picker = ImagePicker();
  final ProfileCubit profileCubit = ProfileCubit();
  final ProfileDetails profileDetails;
  final ProfileimageCubit profileimageCubit = ProfileimageCubit();

  final _profileKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: BlocConsumer(
        cubit: profileCubit,
        listener: (context, state) {
          if (state is ProfileUpdated) {
            BotToast.closeAllLoading();
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            accountCubit.loadAccount(
                Provider.of<UserData>(context, listen: false).userId);
            Navigator.pop(context);
          } else if (state is ProfileFailed) {
            BotToast.closeAllLoading();
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
          } else if (state is ProfileUpdating) {
            BotToast.showLoading();
          }
        },
        builder: (context, state) {
          return Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
              child: FormBuilder(
                key: _profileKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "Profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: CircleAvatar(
                              backgroundColor: Colors.black38,
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                              )),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    BlocBuilder(
                      cubit: profileimageCubit,
                      builder: (context, state) {
                        if (state is ProfileimageInitial) {
                          return profileDetails.photo == null
                              ? Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black38,
                                    child: Icon(Icons.person),
                                    radius: 50,
                                  ),
                                )
                              : Center(
                                  child: CachedNetworkImage(
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    imageUrl:
                                        "https://evorgaming.com/storage/${profileDetails.photo}",
                                  ),
                                );
                        } else if (state is ProfileimageUpdating) {
                          return Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black38,
                              child: CircularProgressIndicator(),
                              radius: 50,
                            ),
                          );
                        } else if (state is ProfileimageUpdated) {
                          return Center(
                            child: CachedNetworkImage(
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              imageUrl:
                                  "https://evorgaming.com/storage/profile-photos/${state.data.message}",
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Center(
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.red.shade800),
                        highlightedBorderColor: Colors.red.shade800,
                        onPressed: () async {
                          final pickedFile = await picker.getImage(
                              source: ImageSource.gallery);
                          var fileName = pickedFile.path.split('/').last;
                          profileimageCubit.uploadimage(
                              Provider.of<UserData>(context, listen: false)
                                  .userId,
                              pickedFile.path,
                              fileName);
                        },
                        child: AutoSizeText("Select A New Photo"),
                      ),
                    ),
                    SizedBox(height: 8),
                    FormBuilderTextField(
                      initialValue: profileDetails.name,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                      ),
                      name: "name",
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      initialValue:
                          Provider.of<UserData>(context, listen: false).userId,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                      ),
                      name: "new_email",
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderPhoneField(
                      initialValue: profileDetails.mobileNo,
                      name: "mobile_no",
                      defaultSelectedCountryIsoCode: "PK",
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(context, 13,
                            errorText: "Incorrect length"),
                        FormBuilderValidators.maxLength(context, 13,
                            errorText: "Incorrect length")
                      ]),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          _profileKey.currentState.save();
                          if (_profileKey.currentState.validate()) {
                            var finalData = <String, dynamic>{};
                            finalData.addAll(_profileKey.currentState.value);
                            finalData["email"] =
                                Provider.of<UserData>(context, listen: false)
                                    .userId;
                            profileCubit.submitRequest(finalData);
                          } else {
                            print("validation failed");
                          }
                        },
                        child: AutoSizeText(
                          "SAVE",
                        ),
                        color: Colors.red.shade800,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
