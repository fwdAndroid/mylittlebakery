import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylittlebakery/seller/gigs/edit_gigs.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class Seller_Orders_Detials extends StatefulWidget {
  final categoryname;
  final price;
  final description;
  final photoUrl;
  final id;
  final uuid;

  Seller_Orders_Detials(
      {super.key,
      required this.categoryname,
      required this.price,
      required this.description,
      required this.id,
      required this.uuid,
      required this.photoUrl});

  @override
  State<Seller_Orders_Detials> createState() => _Seller_Orders_DetialsState();
}

class _Seller_Orders_DetialsState extends State<Seller_Orders_Detials> {
  @override
  Widget build(BuildContext context) {
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
          "Order Detail",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            // group10000039213At (22:544)
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
            padding: EdgeInsets.fromLTRB(1.3, 0, 0, 0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // rectangle20iQk (22:566)
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  // itemnameqcY (22:545)
                  margin: EdgeInsets.fromLTRB(0.7, 0, 0, 12),
                  child: Text(
                    'Item Name',
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      height: 1.185,
                      letterSpacing: 0.5,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // categoryWya (22:546)
                  margin: EdgeInsets.fromLTRB(0.7, 0, 0, 13),
                  child: Text(
                    widget.categoryname,
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.185,
                      letterSpacing: 0.36,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  // itemnameqcY (22:545)
                  margin: EdgeInsets.fromLTRB(0.7, 0, 0, 12),
                  child: Text(
                    'Price',
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      height: 1.185,
                      letterSpacing: 0.5,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // categoryWya (22:546)
                  margin: EdgeInsets.fromLTRB(0.7, 0, 0, 13),
                  child: Text(
                    widget.price,
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.185,
                      letterSpacing: 0.36,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  // itemnameqcY (22:545)
                  margin: EdgeInsets.fromLTRB(0.7, 0, 0, 12),
                  child: Text(
                    'Description',
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      height: 1.185,
                      letterSpacing: 0.5,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // group1000003923AGk (22:570)

                  child: SizedBox(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 373,
                      ),
                      child: Text(
                        widget.description,
                        style: SafeGoogleFont(
                          'Rubik',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.185,
                          letterSpacing: 0.4,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Spacer(),
          // 0xfffecec1
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Order Started",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    0xfffecec1,
                  ),
                  shape: StadiumBorder(),
                  fixedSize: Size(306, 58)),
            ),
          )
        ],
      ),
    );
  }
}
