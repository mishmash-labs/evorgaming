import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';

import '../cubits/signuppage/signup_cubit.dart';

class SignupPage extends StatelessWidget {
  final SignupCubit signupCubit = SignupCubit();
  final String phoneNumber;

  final _signupKey = GlobalKey<FormBuilderState>();

  SignupPage({Key key, this.phoneNumber}) : super(key: key);

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
            key: _signupKey,
            child: ListView(
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
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
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
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(height: 16),
                FormBuilderPhoneField(
                  name: "phone_no",
                  initialValue: phoneNumber,
                  enabled: false,
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
                    FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(height: 16),
                FormBuilderRadioGroup(
                  initialValue: "Male",
                  activeColor: Colors.red.shade800,
                  decoration: InputDecoration(
                    labelText: "Gender",
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
                  name: 'gender',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  options: [
                    'Male',
                    'Female',
                  ]
                      .map((gen) => FormBuilderFieldOption(value: gen))
                      .toList(growable: false),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: "password",
                  cursorColor: Colors.red,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 8),
                  ]),
                ),
                SizedBox(height: 16),
                FormBuilderTextField(
                  name: "confirmpassword",
                  cursorColor: Colors.red,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Re-Type Password",
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    (val) {
                      if (_signupKey.currentState.fields['password']?.value !=
                          val) return 'Password does not match';
                      return null;
                    }
                  ]),
                ),
                SizedBox(height: 16),
                BlocConsumer(
                  bloc: signupCubit,
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      BotToast.showText(
                          text: state.data.message,
                          duration: Duration(seconds: 4));
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    }
                    if (state is SignupFailed) {
                      BotToast.showText(
                          text: state.data.message,
                          duration: Duration(seconds: 4));
                    }
                  },
                  builder: (context, state) {
                    return OutlineButton(
                      borderSide: BorderSide(color: Colors.red.shade800),
                      highlightedBorderColor: Colors.red.shade800,
                      onPressed: () {
                        if (state is SignupLoading) {
                        } else {
                          _signupKey.currentState.save();
                          if (_signupKey.currentState.validate()) {
                            signupCubit.register(_signupKey.currentState.value);
                          } else {
                            print("validation failed");
                          }
                        }
                      },
                      child: state is SignupLoading
                          ? SpinKitThreeBounce(
                              color: Colors.red.shade900,
                              size: 20,
                            )
                          : AutoSizeText("Register"),
                    );
                  },
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
