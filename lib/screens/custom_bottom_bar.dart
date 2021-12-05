import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_auth/profile/profile_screen.dart';
import 'package:phone_auth/screens/addOn.dart';
import 'package:phone_auth/screens/bookSlot.dart';
import 'package:phone_auth/screens/home.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatefulWidget {
  final TabController controller;

  const CustomBottomBar({Key key, this.controller}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int index = 0;
  // void initState() {
  //   super.initState();
  //   widget.controller.addListener(() {
  //     if (widget.controller.indexIsChanging) {
  //       setState(() {
  //         index = widget.controller.index;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shape: CircularNotchedRectangle(),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(0),
              height: 50,
              child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(Icons.dashboard,
                            color: index == 0 ? Colors.black : Colors.grey),
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: index == 0 ? Colors.black : Colors.grey),
                      ),
                    ],
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddOn()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(0),
              height: 50,
              child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2),
                        child:
                            Icon(Icons.add_circle_outline, color: Colors.grey),
                      ),
                      Text(
                        "Add On",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookSlot()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(0),
              height: 50,
              child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(Icons.event_note_outlined,
                            color: index == 1 ? Colors.black : Colors.grey),
                      ),
                      Text(
                        "Book Slot",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: index == 1 ? Colors.black : Colors.grey),
                      ),
                    ],
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellerProfileScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(0),
              height: 50,
              child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.person,
                          color: index == 3 ? Colors.black : Colors.grey,
                        ),
                      ),
                      Text(
                        "User",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: index == 3 ? Colors.black : Colors.grey),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
