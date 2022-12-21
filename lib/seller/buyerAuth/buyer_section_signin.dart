import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/seller/buyerAuth/buyer_section_signup.dart';
import 'package:mylittlebakery/seller/main_section/mainscreen.dart';
import 'package:mylittlebakery/database/Firebase_auth_data.dart';
import 'package:mylittlebakery/widgets/snak.dart';
import 'package:mylittlebakery/widgets/text_form_field.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class SellerSignIn extends StatefulWidget {
  @override
  State<SellerSignIn> createState() => _SellerSignInState();
}

class _SellerSignInState extends State<SellerSignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // coffeeshoprafikiHDW (1:664)
            margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11.16 * fem, 16.99 * fem),
            width: 297 * fem,
            height: 219.01 * fem,
            child: Image.asset(
              'assets/coffee-shop-rafiki-jUx.png',
              width: 297 * fem,
              height: 219.01 * fem,
            ),
          ),
          Container(
            // letssigninLxU (1:134)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10.16 * fem, 0 * fem),
            child: Text(
              'Let’s Sign In',
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
            // autogroupzwoacuz (55KruoRF85RU8wvVikzwoA)
            padding: EdgeInsets.fromLTRB(0 * fem, 28 * fem, 0 * fem, 0 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // group9587e (1:135)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 46 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormInputField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        textInputType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        isPass: true,
                        controller: passController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        // forgotpasswordGFn (1:140)
                        width: double.infinity,
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.3 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    // group1000003251tHA (1:284)
                    width: 333,
                    height: 58,
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
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Sign In',
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
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => SellerSignUp()));
                  },
                  child: Container(
                    // donthaveanaccountsignupjYg (1:149)

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
                            text: 'Don’t  have an account?   ',
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
                            text: 'Sign up',
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // line1H8G (1:152)
                        margin: EdgeInsets.fromLTRB(
                            50 * fem, 1 * fem, 8.5 * fem, 0 * fem),
                        width: 83 * fem,
                        height: 2 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff000000),
                        ),
                      ),
                      Container(
                        // orcontinuewithymn (1:151)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 12.5 * fem, 0 * fem),
                        child: Text(
                          'Or Continue with',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.185 * ffem / fem,
                            letterSpacing: 0.28 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // line25K2 (1:153)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 7 * fem, 0 * fem, 0 * fem),
                        width: 80 * fem,
                        height: 2 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 140,
                    height: 50,
                    child: Image.asset("assets/google.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().loginUpUser(
      email: emailController.text,
      pass: passController.text,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'sucess') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builder) => SellerMainScreen(),
          ));
    } else {
      showSnakBar(rse, context);
    }
  }
}
