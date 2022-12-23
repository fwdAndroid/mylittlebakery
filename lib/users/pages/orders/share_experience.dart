import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylittlebakery/users/main/user_main_screen.dart';
import 'package:uuid/uuid.dart';

class ShareExperience extends StatefulWidget {
  String sellerid;
  String? categoryName;
  String orderid;
  String? itemName;
  String? description;
  String? photoURL;
  int? price;
  String? name;
  ShareExperience(
      {super.key,
      required this.orderid,
     required this.sellerid,
      this.categoryName,
      this.description,
      this.itemName,
      this.price,
      this.photoURL,
      this.name});

  @override
  State<ShareExperience> createState() => _ShareExperienceState();
}

class _ShareExperienceState extends State<ShareExperience> {
  TextEditingController shareController = TextEditingController();
  bool isload = false;
  double ns = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
              "Share Experience",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.photoURL.toString()),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.itemName!,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: shareController,
                  maxLines: 5, //or null
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 5, left: 10),
                      hintText: "Write a comment here!"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Give Ratings",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              RatingBar.builder(
                onRatingUpdate: (value) {
                  setState(() {
                    this.ns = value;
                  });
                },
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50.0,
                unratedColor: Colors.amber.withAlpha(50),
              ),
              Container(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () async {
                  print(ns);
                  var os = Uuid().v1();
                  await FirebaseFirestore.instance
                      .collection("reviews")
                      .doc("ordersid")
                      .collection(os)
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                    "price":widget.price,    
                    "orderid": widget.orderid,
                    "reviews": ns,
                    "description": shareController.text,
                    "sellerid": widget.sellerid,
                    "userid": FirebaseAuth.instance.currentUser!.uid,
                    "itemName": widget.itemName
                  }).then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => UserMainScreen()));
                  });
                },
                child: isload == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffFECEC1),
                    fixedSize: Size(306, 59),
                    shape: StadiumBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => UserMainScreen()));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(306, 59),
                    shape: StadiumBorder()),
              )
            ],
          )),
    );
  }
}
