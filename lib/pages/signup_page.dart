import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

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
          child: FormBuilder(
            child: ListView(
              key: _formKey,
              children: [
                Image.asset(
                  "assets/logo.png",
                ),
                SizedBox(height: 48),
                FormBuilderTextField(
                  name: "name",
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
                FormBuilderTextField(
                  name: "email",
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
                FormBuilderPhoneField(
                  name: "phone_no",
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
                SizedBox(height: 16),
                FormBuilderRadioGroup(
                  initialValue: "Male",
                  decoration: InputDecoration(
                    labelText: "Gender",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                  ),
                  name: 'gender',
                  validator: FormBuilderValidators.required(context),
                  options: [
                    'Male',
                    'Female',
                  ]
                      .map((lang) => FormBuilderFieldOption(value: lang))
                      .toList(growable: false),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: "password",
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
                FormBuilderTextField(
                  name: "confirmpassword",
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    labelText: "Re-Type Password",
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
                  child: AutoSizeText("Register"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: AutoSizeText("Already Registered?"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
