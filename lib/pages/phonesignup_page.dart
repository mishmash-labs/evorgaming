import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';

import 'otp_page.dart';

class PhoneSignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 1),
              Image.asset(
                "assets/logo.png",
              ),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderPhoneField(
                      defaultSelectedCountryIsoCode: "PK",
                      name: "phone_no",
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 13,
                            errorText: "Incorrect length"),
                        FormBuilderValidators.maxLength(context, 13,
                            errorText: "Incorrect length")
                      ]),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlineButton(
                        child: Text("Send OTP"),
                        borderSide: BorderSide(color: Colors.red.shade800),
                        highlightedBorderColor: Colors.red.shade800,
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpPage(
                                  phoneNumber:
                                      _formKey.currentState.value["phone_no"],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 36)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
