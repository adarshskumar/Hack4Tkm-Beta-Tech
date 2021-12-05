import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_auth/Signup/signup_screen.dart';
import 'package:phone_auth/profile/components/body.dart';
import 'package:phone_auth/profile/profile_screen.dart';
import 'package:phone_auth/screens/home.dart';
import 'package:phone_auth/verifyOtp.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool authenticated = false;
    return MaterialApp(
      title: 'Beta Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

// class ScreensController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of(context);
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//     print(auth.status);
//     switch (auth.status) {
//       case Status.Unauthenticated:
//         return SignUpScreen();
//       case Status.Authenticating:
//         //   return ConfirmOtpPage();
//         // case Status.Authenticated:
//         return Home();
//     }
//   }
// }
