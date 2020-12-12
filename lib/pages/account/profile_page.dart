import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)), //this right here
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
              CircleAvatar(
                backgroundColor: Colors.black38,
                child: Icon(Icons.person),
                minRadius: 50,
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
                initialValue: "John Smith",
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
                initialValue: "john@example.com",
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
