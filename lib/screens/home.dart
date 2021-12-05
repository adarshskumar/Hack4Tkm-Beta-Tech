import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phone_auth/Signup/constants.dart';
import 'package:phone_auth/screens/categories.dart';
import 'package:phone_auth/screens/custom_bottom_bar.dart';
import 'package:phone_auth/screens/discount_banner.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Beta Tech',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          DiscountBanner(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Categories(),
          ),
          SizedBox(
            height: 20,
          ),
          CircularPercentIndicator(
            radius: 180.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: 0.6,
            center: new Text(
              "10 Units",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: kPrimaryLightColor,
            progressColor: kPrimaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 22),
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: users,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return Text('Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    }
                    final data = snapshot.requireData;
                    return
                        // Builder(
                        //     builder: (BuildContext context) =>
                        //         Text('Name: ${data.docs[0]['name']}'));
                        ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Allowed Units: ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${data.docs[0]['allowed_units']}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Buffer Units : ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${data.docs[0]['allowed_units_high']}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Used Units : ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${data.docs[0]['used_units']}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                  },
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.red,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CustomBottomBar(),
        ],
      ),
    );
  }
}
