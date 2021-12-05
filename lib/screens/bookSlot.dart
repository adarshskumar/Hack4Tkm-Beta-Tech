import 'package:flutter/material.dart';
import 'package:phone_auth/screens/home.dart';

class BookSlot extends StatefulWidget {
  const BookSlot();

  @override
  _BookSlotState createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Book Your Slot',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Image.asset('images/slot.png'),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
                'No Slots available in your location. we will notify you when it is available....',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
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
