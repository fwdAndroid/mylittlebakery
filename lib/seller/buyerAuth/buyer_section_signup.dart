import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylittlebakery/seller/buyerAuth/buyer_section_signin.dart';
import 'package:mylittlebakery/seller/gigs/sellergigs.dart';
import 'package:mylittlebakery/seller/main_section/mainscreen.dart';
import 'package:mylittlebakery/database/Firebase_auth_data.dart';
import 'package:mylittlebakery/widgets/snak.dart';
import 'package:mylittlebakery/widgets/text_form_field.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class SellerSignUp extends StatefulWidget {
  @override
  State<SellerSignUp> createState() => _SellerSignUpState();
}

class _SellerSignUpState extends State<SellerSignUp> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  Uint8List? _image;

  //Looding Variable
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passController.clear();
    addresscontroller.clear();
    userNameController.clear();
    nameController.clear();
    phonenumberController.clear();
  }

  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  // letssignupoQQ (1:333)
                  // margin:
                  //     EdgeInsets.fromLTRB(0 * fem, 25 * fem, 0.16 * fem, 0 * fem),
                  child: Text(
                    'Let???s Sign Up',
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
                      InkWell(
                        onTap: () => selectImage(),
                        child: Center(
                          // fluentadd12fillede3e (1:331)
                          child: _image != null
                              ? CircleAvatar(
                                  radius: 59,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : Container(
                                  padding: EdgeInsets.all(10),
                                  width: 146.71 * fem,
                                  height: 146.71 * fem,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xfffecec1)),
                                    color: Color(0xffd9d9d9),
                                    borderRadius:
                                        BorderRadius.circular(75 * fem),
                                  ),
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
                      TextFormInputField(
                        textInputType: TextInputType.text,
                        hintText: 'Full Name',
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormInputField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormInputField(
                        textInputType: TextInputType.text,
                        hintText: 'User Name',
                        controller: userNameController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormInputField(
                        textInputType: TextInputType.text,
                        hintText: 'Phone Number',
                        controller: phonenumberController,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormInputField(
                        textInputType: TextInputType.text,
                        hintText: 'Address',
                        controller: addresscontroller,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormInputField(
                        isPass: true,
                        textInputType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        controller: passController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: signUpUsers,
                        child: Container(
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
                              child: _isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Text(
                                      'Sign Up',
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => SellerSignIn()));
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
      ),
    );
  }

  /// Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  signUpUsers() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().signUpUser(
        email: emailController.text,
        pass: passController.text,
        name: nameController.text,
        address: addresscontroller.text,
        phoneNumber: phonenumberController.text,
        username: userNameController.text,
        file: _image!);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => SellerGigs()));
    }
  }
}
