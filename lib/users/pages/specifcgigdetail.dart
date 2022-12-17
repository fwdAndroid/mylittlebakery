import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SpecificGigDetail extends StatefulWidget {
  String? id;
  String? categoryName;
  String? itemName;
  List<dynamic>? multiImages;
  String? description;
  String? photoURL;
  String? price;
  SpecificGigDetail(
      {Key? key,
      this.id,
      this.categoryName,
      this.multiImages,
      this.itemName,
      this.photoURL,
      this.price,
      this.description})
      : super(key: key);

  @override
  State<SpecificGigDetail> createState() => _SpecificGigDetailState();
}

class _SpecificGigDetailState extends State<SpecificGigDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
