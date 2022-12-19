import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylittlebakery/database/Firebase_database.dart';
import 'package:mylittlebakery/seller/gigs/gig_images.dart';
import 'package:mylittlebakery/seller/main_section/mainscreen.dart';
import 'package:mylittlebakery/widgets/snak.dart';
import 'package:mylittlebakery/widgets/utils.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';

class EditGig extends StatefulWidget {
  @override
  State<EditGig> createState() => _EditGigState();
}

class _EditGigState extends State<EditGig> {
  @override
  TextEditingController itemController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Uint8List? _image;

  //Looding Variable
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    itemController.clear();
    categoryController.clear();
    priceController.clear();
    descriptionController.clear();
  }

  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(right: 20),
          // letssignupoQQ (1:333)
          // margin:
          //     EdgeInsets.fromLTRB(0 * fem, 25 * fem, 0.16 * fem, 0 * fem),
          child: Text(
            'Edit Gig',
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
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection("gigs")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("records")
                .doc()
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }

              var document = snapshot.data;
              // _image = document['photoURL'];
              itemController.text = document['itemName'];
              categoryController.text = document['categoryName'];
              descriptionController.text = document['description'];
              priceController.text = document["price"];
              return Container(
                // signup21E2Y (1:288)
                padding: EdgeInsets.fromLTRB(
                    39.99 * fem, 13 * fem, 29.83 * fem, 13 * fem),
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
                                          border: Border.all(
                                              color: Color(0xfffecec1)),
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
                            SizedBox(
                              height: 50,
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
                                controller: itemController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintText: 'Item Name',
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
                                keyboardType: TextInputType.emailAddress,
                                controller: categoryController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintText: 'Category',
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
                                keyboardType: TextInputType.number,
                                controller: priceController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintText: 'Price',
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
                                maxLines: 5,
                                controller: descriptionController,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintMaxLines: 20,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: InputBorder.none,
                                  hintText: 'Description',
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
                            InkWell(
                              onTap: () {
                                gig();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            SellerMainScreen()));
                              },
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
                                    borderRadius:
                                        BorderRadius.circular(40 * fem),
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
                                            'Update Gig',
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
            }),
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

  var id = Uuid().v1();
  gig() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseMethods().gigUpdat(
        itemName: itemController.text,
        price: priceController.text,
        categoryName: categoryController.text,
        uuid: id,
        description: descriptionController.text,
        file: _image!);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {}
  }
}
