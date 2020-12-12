import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
              ),
              SizedBox(height: 48),
              TextFormField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  labelText: "Email Address",
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
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  labelText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade800),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                ),
              ),
              SizedBox(height: 16),
              OutlineButton(
                borderSide: BorderSide(color: Colors.red.shade800),
                highlightedBorderColor: Colors.red.shade800,
                onPressed: () {},
                child: AutoSizeText("Login"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
                child: AutoSizeText("Create A New Account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
