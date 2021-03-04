import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../cubits/loginpage/login_cubit.dart';
import '../navigation_page.dart';
import '../providers/userdata_provider.dart';
import 'phonesignup_page.dart';

class LoginPage extends StatelessWidget {
  final LoginCubit loginCubit = LoginCubit();

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
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                ),
                SizedBox(height: 48),
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
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
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(height: 16),
                BlocConsumer(
                  cubit: loginCubit,
                  listener: (context, state) async {
                    if (state is LoginSuccess) {
                      await FirebaseMessaging.instance.subscribeToTopic(
                          _formKey.currentState.value['email']);
                      Provider.of<UserData>(context, listen: false).loggedIn =
                          true;
                      Provider.of<UserData>(context, listen: false).userId =
                          _formKey.currentState.value['email'];
                      Provider.of<UserData>(context, listen: false).userNumID =
                          state.data.message;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavPage(),
                        ),
                      );
                    }
                    if (state is LoginFailed) {
                      BotToast.showText(
                          text: state.data.message,
                          duration: Duration(seconds: 4));
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.red.shade800),
                        highlightedBorderColor: Colors.red.shade800,
                        onPressed: () {
                          if (state is LoginLoading) {
                          } else {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              loginCubit.login(
                                  _formKey.currentState.value['email'],
                                  _formKey.currentState.value['password']);
                            } else {
                              print("validation failed");
                            }
                          }
                        },
                        child: state is LoginLoading
                            ? SpinKitThreeBounce(
                                color: Colors.red.shade900,
                                size: 20,
                              )
                            : AutoSizeText("Login"),
                      ),
                    );
                  },
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneSignupPage(),
                      ),
                    );
                  },
                  child: AutoSizeText("Create A New Account"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
