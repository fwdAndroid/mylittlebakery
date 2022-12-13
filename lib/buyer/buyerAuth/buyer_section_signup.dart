import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/buyer/buyerAuth/buyer_section_signin.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class BuyerSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        // signup21E2Y (1:288)
        padding:
            EdgeInsets.fromLTRB(39.99 * fem, 13 * fem, 29.83 * fem, 13 * fem),
        width: double.infinity,
        height: 926 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(25 * fem),
        ),
        child: Container(
          // frame58rpc (1:289)
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // letssignupoQQ (1:333)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 25 * fem, 0.16 * fem, 0 * fem),
                child: Text(
                  'Let’s Sign Up',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Rubik',
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.185 * ffem / fem,
                    letterSpacing: 0.4 * fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // autogrouptyhvFnC (55KtVRTFGrANo5jPDHTyHv)
                padding: EdgeInsets.fromLTRB(
                    21.01 * fem, 40 * fem, 31.17 * fem, 0 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup2vtyMqE (55KtHRoEQma5MdcQGw2VtY)
                      margin: EdgeInsets.fromLTRB(
                          78 * fem, 0 * fem, 78 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          50.92 * fem, 50.92 * fem, 52.37 * fem, 52.38 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfffecec1)),
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(75 * fem),
                      ),
                      child: Center(
                        // fluentadd12fillede3e (1:331)
                        child: SizedBox(
                          width: 46.71 * fem,
                          height: 46.71 * fem,
                          child: Image.asset(
                            'assets/fluent-add-12-filled-m7r.png',
                            width: 46.71 * fem,
                            height: 46.71 * fem,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // createaccount9WC (1:307)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 151 * fem, 18 * fem),
                      child: Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Rubik',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.185 * ffem / fem,
                          letterSpacing: 0.4 * fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 17 * fem),

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
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          hintStyle: SafeGoogleFont(
                            'Rubik',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: Color(0x7f000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 17 * fem),

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
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: SafeGoogleFont(
                            'Rubik',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: Color(0x7f000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 17 * fem),

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
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buyer Name',
                          hintStyle: SafeGoogleFont(
                            'Rubik',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: Color(0x7f000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 17 * fem),

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
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: SafeGoogleFont(
                            'Rubik',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: Color(0x7f000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 17 * fem),

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
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Address',
                          hintStyle: SafeGoogleFont(
                            'Rubik',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: Color(0x7f000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 17 * fem),

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
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: SafeGoogleFont(
                            'Rubik',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.32 * fem,
                            color: Color(0x7f000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // group1000003020aqi (1:326)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 33.25 * fem),
                      width: double.infinity,
                      height: 58.75 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40 * fem),
                      ),
                      child: Container(
                        // group1000003251J12 (1:327)
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
                          child: Text(
                            'Next',
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => BuyerSignIn()));
                      },
                      child: Container(
                        // alreadyhaveanaccountsigninwZn (1:325)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 24.99 * fem),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1850000109 * ffem / fem,
                              letterSpacing: 0.28 * fem,
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: 'Already have an account?   ',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  letterSpacing: 0.28 * fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  letterSpacing: 0.28 * fem,
                                  color: Color(0xfffecec1),
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  letterSpacing: 0.28 * fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
