import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody();

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 22),
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.red,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'images/l.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1.5),
                    blurRadius: 6,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),
        ),
        StreamBuilder(builder: (context, snapshot) {
          return Container(
              padding: const EdgeInsets.all(10.0),
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new Column(
                        children: [
                          // ProfilePic(),
                          ProfileMenu(
                            text: 'Mhd Hisham V',
                            icon: "assets/icons/User Icon.svg",
                            press: () => {},
                          ),
                          ProfileMenu(
                            text: '8086890954',
                            icon: "assets/icons/Mail.svg",
                            press: () {},
                          ),
                          ProfileMenu(
                            text: '190609',
                            icon: "assets/icons/Bill Icon.svg",
                            press: () {},
                          ),
                          ProfileMenu(
                            text: "house",
                            icon: "assets/icons/Question mark.svg",
                            press: () {},
                          ),
                          ProfileMenu(
                            text: "Log Out",
                            icon: "assets/icons/Log out.svg",
                            press: () {},
                          ),
                        ],
                      );
                  }
                },
              ));
        }),
      ],
    );
  }
}
