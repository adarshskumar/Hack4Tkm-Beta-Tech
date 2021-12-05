import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:phone_auth/Signup/constants.dart';
import 'package:phone_auth/screens/home.dart';

enum Status {
  Uninitialized,
  /*Authenticated,*/ Authenticating,
  Unauthenticated,
  Registered
}

class VerifyOtp extends StatefulWidget {
  VerifyOtp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String verId;
  String phone;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        codeSent
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 30,
                  style: TextStyle(fontSize: 20),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    verifyPin(pin);
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.0),
                      ),
                      labelText: 'Enter Phone Number',
                      // labelStyle: TextStyle(
                      //   color: kPrimaryColor,
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        // borderSide: BorderSide(),
                      )),
                  initialCountryCode: 'IN',
                  onChanged: (phoneNumber) {
                    setState(() {
                      phone = phoneNumber.completeNumber;
                    });
                  },
                ),
              ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 57,
          width: MediaQuery.of(context).size.width * 0.65,
          child: RaisedButton(
            onPressed: () async {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(0),
            child: Ink(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: codeSent
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Verify",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        verifyPhone();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Send OTP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          return Home();
          // final snackBar = SnackBar(content: Home());
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        verificationFailed: (FirebaseAuthException e) {
          final snackBar = SnackBar(content: Text("${e.message}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verficationId, int resendToken) {
          setState(() {
            codeSent = true;
            verId = verficationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verId = verificationId;
          });
        },
        timeout: Duration(seconds: 60));
  }

  Future<void> verifyPin(String pin) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      return Home();
      // final snackBar = SnackBar(content: Text("Login Success"));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text("${e.message}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
