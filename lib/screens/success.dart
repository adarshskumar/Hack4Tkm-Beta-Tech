import 'package:flutter/material.dart';
import 'package:phone_auth/screens/home.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Request Submitted...',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Image.asset('images/success.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 50.0, top: 30, bottom: 25, right: 50),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  elevation: 2,
                  primary: Colors.black,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 11),
                  child: Text('Back to Home'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
