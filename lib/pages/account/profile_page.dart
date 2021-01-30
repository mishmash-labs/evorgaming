import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evorgaming/cubits/accountpage/account_cubit.dart';
import 'package:evorgaming/cubits/profileimage/profileimage_cubit.dart';
import 'package:evorgaming/cubits/profilepage/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:provider/provider.dart';

import '../../models/account_model.dart';
import '../../providers/userdata_provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(
      {Key key, @required this.profileDetails, @required this.accountCubit})
      : super(key: key);

  final AccountCubit accountCubit;
  final picker = ImagePickerPlugin();
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
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            accountCubit.loadAccount(
                Provider.of<UserData>(context, listen: false).userId);
            Navigator.pop(context);
          } else if (state is ProfileFailed) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
          }
        },
        builder: (context, state) {
          if (state is ProfileInitial)
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FormBuilder(
                  key: _profileKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        "Profile",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
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
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                imageUrl:
                                    "https://evorgaming.com/storage/profile-photos/${state.data.message}",
                              ),
                            );
                          } else
                            return Container();
                        },
                      ),
                      Center(
                        child: OutlineButton(
                          borderSide: BorderSide(color: Colors.red.shade800),
                          highlightedBorderColor: Colors.red.shade800,
                          onPressed: () async {
                            final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);
                            String fileName = pickedFile.path.split('/').last;
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
                            Provider.of<UserData>(context, listen: false)
                                .userId,
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
                      ),
                      SizedBox(height: 16),
                      FormBuilderTextField(
                        initialValue: profileDetails.mobileNo,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade800),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30),
                          ),
                        ),
                        name: "mobile_no",
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
          else if (state is ProfileUpdating) {
            return Container(
              height: 150,
              child: Center(
                child: SpinKitCubeGrid(
                  color: Colors.red.shade900,
                  size: 50.0,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
