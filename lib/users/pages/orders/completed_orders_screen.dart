import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
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
        body: Column(
      children: [],
    ));
  }
}
