import 'package:flutter/material.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class TextFormInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFormInputField(
      {Key? key,
      required this.controller,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Container(
    //                     // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
    //                     margin: EdgeInsets.fromLTRB(
    //                         0 * fem, 0 * fem, 7 * fem, 17 * fem),

    //                     width: 303 * fem,
    //                     decoration: BoxDecoration(
    //                       color: Color(0xffffffff),
    //                       borderRadius: BorderRadius.circular(10 * fem),
    // boxShadow: [
    //   BoxShadow(
    //     color: Color(0x19000000),
    //     offset: Offset(0 * fem, 0 * fem),
    //     blurRadius: 5 * fem,
    //   ),
    // ],
    //                     ),
    //                     child: TextField(
    //                       controller: emailController,
    //                       textAlign: TextAlign.center,
    //                       decoration: InputDecoration(
    //                         border: InputBorder.none,
    //                         hintText: 'Email',
    //                         hintStyle: SafeGoogleFont(
    //                           'Rubik',
    //                           fontSize: 16 * ffem,
    //                           fontWeight: FontWeight.w500,
    //                           height: 1.185 * ffem / fem,
    //                           letterSpacing: 0.32 * fem,
    //                           color: Color(0x7f000000),
    //                         ),
    //                       ),
    //                     ),
    //                   ),

    return Container(
      width: 270,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            offset: Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: SafeGoogleFont(
            'Rubik',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.185,
            letterSpacing: 0.32,
            color: Color(0x7f000000),
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        keyboardType: textInputType,
        controller: controller,
        obscureText: isPass,
      ),
    );
  }
}
