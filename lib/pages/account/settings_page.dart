import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)), //this right here
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                "Enter Your Game Character ID's",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              AutoSizeText(
                "Note : You must Enter your correct character ID. You won't be able to change it later by yourself. But if you want to do so you have to contact support.",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 8),
              TextField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: 'ENTER PUBG CHARACTER ID',
                ),
              ),
              TextField(
                cursorColor: Colors.red,
                decoration:
                    InputDecoration(hintText: 'ENTER COD MOBILE CHARACTER ID'),
              ),
              TextField(
                cursorColor: Colors.red,
                decoration:
                    InputDecoration(hintText: 'ENTER FREE FIRE CHARACTER ID'),
              ),
              TextField(
                cursorColor: Colors.red,
                decoration:
                    InputDecoration(hintText: 'ENTER CS GO CHARACTER ID'),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: AutoSizeText(
                    "Add Now",
                  ),
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
