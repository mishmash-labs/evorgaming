import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/userdata_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key, @required this.profileDetails}) : super(key: key);

  final ProfileDetails profileDetails;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              profileDetails.photo == null
                  ? Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Icon(Icons.person),
                        radius: 50,
                      ),
                    )
                  : Center(
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        imageUrl: "https://evorgaming.com/storage/" +
                            profileDetails.photo,
                      ),
                    ),
              Center(
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.red.shade800),
                  highlightedBorderColor: Colors.red.shade800,
                  onPressed: () {},
                  child: AutoSizeText("Select A New Photo"),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
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
              ),
              SizedBox(height: 16),
              TextFormField(
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
              ),
              SizedBox(height: 16),
              TextFormField(
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
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
  }
}
