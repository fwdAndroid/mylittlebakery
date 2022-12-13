import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/buyer/buyerAuth/buyer_section_signin.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class UserSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentTab = 0;
    ;
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // letssignupvG4 (2:935)
            margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1.16 * fem, 207 * fem),
            child: Text(
              'Let’s Sign Up',
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
          ),
          Container(
            // signupasyVE (2:921)
            margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 222.16 * fem, 0 * fem),
            child: Text(
              'Sign up as ',
              style: SafeGoogleFont(
                'Rubik',
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.185 * ffem / fem,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            // autogrouppr76FxY (55HphcZ3H7kfbEAmd2Pr76)
            padding: EdgeInsets.fromLTRB(
                21.01 * fem, 21 * fem, 31.17 * fem, 0 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // group212kPW (2:922)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 2 * fem, 10 * fem),
                  width: double.infinity,
                  height: 41 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Container(
                    // group6T32 (2:923)
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'User',
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
                Container(
                  // orufi (2:929)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 9 * fem),
                  child: Text(
                    'or',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.185 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => BuyerSignIn()));
                  },
                  child: Container(
                    // group211NpC (2:926)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 2 * fem, 249 * fem),
                    width: double.infinity,
                    height: 41 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x19000000)),
                      color: Color(0xffffffff),
                      //      currentTab == 1 ? Color(0xfffecec1) : Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(0 * fem, 1 * fem),
                          blurRadius: 10 * fem,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          ' Become a Seller  ',
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
    );
  }
}
