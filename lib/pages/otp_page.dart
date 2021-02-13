import 'package:bot_toast/bot_toast.dart';
import 'package:evorgaming/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key, this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String verificationID;

  @override
  void initState() {
    sendCode();
    super.initState();
  }

  void sendCode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        BotToast.showText(text: e.message, duration: Duration(seconds: 6));
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 2);
      },
      codeSent: (String verificationId, int resendToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<String> validateOtp(String otp) async {
    var temp = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);
    var response = await FirebaseAuth.instance.signInWithCredential(temp);
    if (response.user != null) {
      return null;
    } else
      BotToast.showText(text: "Incorrect OTP");
    return "Incorrect";
  }

  void moveToNextScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPage(
          phoneNumber: widget.phoneNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OtpScreen.withGradientBackground(
      bottomColor: Colors.black,
      topColor: Colors.red.shade800,
      otpLength: 6,
      icon: Image.asset(
        "assets/logo.png",
      ),
      subTitle: "Please enter the code sent to your\n device",
      validateOtp: validateOtp,
      routeCallback: moveToNextScreen,
      titleColor: Colors.white,
      themeColor: Colors.white,
    );
  }
}
