import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/users/pages/orders/share_experience.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class OrdersCompleted extends StatefulWidget {
  @override
  State<OrdersCompleted> createState() => _OrdersCompletedState();
}

class _OrdersCompletedState extends State<OrdersCompleted> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/back.png"),
            ),
          ),
          elevation: 3,
          centerTitle: true,
          title: Text(
            "Payment",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Hotel Booking-pana 1.png"),
            Text(
              "Congratulation",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your order has been completed",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 120,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ShareExperience()));
              },
              child: Text(
                "OK",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffFECEC1),
                  fixedSize: Size(306, 59),
                  shape: StadiumBorder()),
            )
          ],
        ));
  }
}
