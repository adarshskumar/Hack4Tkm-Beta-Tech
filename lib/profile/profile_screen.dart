import 'package:flutter/material.dart';
import 'package:phone_auth/screens/custom_bottom_bar.dart';

import 'components/body.dart';

class SellerProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileBody(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
            ),
            CustomBottomBar(),
          ],
        ),
      ),
    );
  }
}
