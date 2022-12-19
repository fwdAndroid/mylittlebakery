import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/database/Firebase_database.dart';
import 'package:mylittlebakery/users/main/user_main_screen.dart';
import 'package:mylittlebakery/widgets/snak.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class Transactions extends StatefulWidget {
  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Credit Details',
          textAlign: TextAlign.center,
          style: SafeGoogleFont(
            'Rubik',
            fontSize: 20 * ffem,
            fontWeight: FontWeight.w500,
            height: 1.185 * ffem / fem,
            letterSpacing: -0.2399999946 * fem,
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // frame41DbS (35:5)
        width: double.infinity,
        height: 883 * fem,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // cardnumberJAx (35:31)
              margin:
                  EdgeInsets.fromLTRB(15.01 * fem, 0 * fem, 0 * fem, 0 * fem),
              child: Text(
                'Card Number',
                style: SafeGoogleFont(
                  'Rubik',
                  fontSize: 15 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.185 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogrouprs7rCGL (55KCT5As6Geui1RZGJRs7r)
              padding: EdgeInsets.fromLTRB(
                  14.01 * fem, 9 * fem, 13.67 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // autogroupzjbzHYg (55KBN29bGtw9ZUr5RQZjbz)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        13 * fem, 7 * fem, 13 * fem, 9 * fem),
                    width: 303 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          offset: Offset(0 * fem, 0 * fem),
                          blurRadius: 5 * fem,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: cardNumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'xxxxxxxxxxxxxxxx',
                        hintStyle: SafeGoogleFont(
                          'Rubik',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.185 * ffem / fem,
                          color: Color(0x7f000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // expirydate5jS (35:30)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                    width: double.infinity,
                    child: Text(
                      'Expiry Date ',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Rubik',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.185 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupcnqaAF6 (55KBbbbJXhDRGmvku6cnqA)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 13 * fem),
                    height: 63 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // autogroupefikG3E (55KBpRZGEMxYeMW14teFik)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 10 * fem, 0 * fem),
                          width: 60 * fem,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle31mkg (35:26)
                                left: 0 * fem,
                                top: 23 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 40 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                        color: Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            offset: Offset(0 * fem, 0 * fem),
                                            blurRadius: 5 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // nfn (35:33)
                                left: 18 * fem,
                                top: 17 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 21 * fem,
                                    height: 24 * fem,
                                    child: TextField(
                                      controller: monthController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(top: 5),
                                        border: InputBorder.none,
                                        hintText: '10',
                                        hintStyle: SafeGoogleFont(
                                          'Rubik',
                                          fontSize: 20 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.185 * ffem / fem,
                                          color: Color(0x7f000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // month596 (35:36)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 58 * fem,
                                    height: 24 * fem,
                                    child: Text(
                                      'Month',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Rubik',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w300,
                                        height: 1.185 * ffem / fem,
                                        color: Color(0x7f000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // mGp (35:34)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 7 * fem, 7 * fem),
                          child: Text(
                            '/',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.1725 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupbnyuTvL (55KBxAqMd3B2pkQqvVbNYU)
                          width: 60 * fem,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle32bme (35:27)
                                left: 0 * fem,
                                top: 23 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 40 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                        color: Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x19000000),
                                            offset: Offset(0 * fem, 0 * fem),
                                            blurRadius: 5 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // fFi (35:35)
                                left: 17 * fem,
                                top: 17 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 24 * fem,
                                    height: 24 * fem,
                                    child: TextField(
                                      controller: yearController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(top: 5),
                                        border: InputBorder.none,
                                        hintText: '20',
                                        hintStyle: SafeGoogleFont(
                                          'Rubik',
                                          fontSize: 20 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.185 * ffem / fem,
                                          color: Color(0x7f000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // yearKr4 (35:38)
                                left: 9 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 40 * fem,
                                    height: 24 * fem,
                                    child: Text(
                                      'Year',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Rubik',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w300,
                                        height: 1.185 * ffem / fem,
                                        color: Color(0x7f000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // cvvoWL (35:32)
                    margin:
                        EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 7 * fem),
                    child: Text(
                      'CVV',
                      style: SafeGoogleFont(
                        'Rubik',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.185 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // lastthreedigitsonthebackofcard (35:37)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4 * fem),
                    width: double.infinity,
                    child: Text(
                      'Last three digits on the back of card!',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Rubik',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.185 * ffem / fem,
                        color: Color(0x7f000000),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupr15ez52 (55KCEANi79J6k1uVAxr15e)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 163 * fem),
                    padding: EdgeInsets.fromLTRB(
                        16 * fem, 7 * fem, 16 * fem, 9 * fem),
                    width: 145 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          offset: Offset(0 * fem, 0 * fem),
                          blurRadius: 5 * fem,
                        ),
                      ],
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: cvvController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 5),
                        border: InputBorder.none,
                        hintText: 'xxx',
                        hintStyle: SafeGoogleFont(
                          'Rubik',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.185 * ffem / fem,
                          color: Color(0x7f000000),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: addPayment,
                    child: Container(
                      // group1000003020Psr (35:39)
                      margin: EdgeInsets.fromLTRB(
                          7 * fem, 0 * fem, 17.5 * fem, 111.25 * fem),
                      width: double.infinity,
                      height: 58.75 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40 * fem),
                      ),
                      child: Container(
                        // group10000032516XN (35:40)
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfffecec1),
                          borderRadius: BorderRadius.circular(40 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x14000000),
                              offset: Offset(20 * fem, 20 * fem),
                              blurRadius: 25 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : Text(
                                  'Confirm',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Rubik',
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.185 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addPayment() async {
    setState(() {
      isLoading = true;
    });
    String rse = await FirebaseMethods().addCard(
      cardNumber: cardNumberController.text,
      uid: FirebaseAuth.instance.currentUser!.uid,
      cvv: cvvController.text,
      year: yearController.text,
      month: monthController.text,
    );

    print(rse);
    setState(() {
      isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => UserMainScreen()));
    }
  }
}
