import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phone_auth/Signup/components/background.dart';
import 'package:phone_auth/Signup/components/or_divider.dart';
import 'package:phone_auth/Signup/components/social_icon.dart';
import 'package:phone_auth/Signup/constants.dart';
import 'package:phone_auth/verifyOtp.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "images/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: 55,
            ),
            // Material(
            //   color: kPrimaryColor,
            //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //   elevation: 5.0,
            //   child: TextButton.icon(
            //     onPressed: () {},
            //     icon: FaIcon(
            //       FontAwesomeIcons.phoneAlt,
            //       color: Colors.white,
            //     ),
            //     label: Text(
            //       'Enter Phone Number\ \ \ \ \ ',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 15.0,
            //       ),
            //     ),
            //   ),
            // ),
            VerifyOtp(),
          ],
        ),
      ),
    );
  }
}
