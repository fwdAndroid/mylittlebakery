import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/users/pages/drawer_user/transactions.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffFECEC1),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => Transactions()));
          }),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("cards_details")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Add Payement Method")),
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: 362,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x21000000),
                          offset: Offset(2, 2),
                          blurRadius: 8.5,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/image-7.png")),
                    title: Container(
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card Number",
                            style: SafeGoogleFont(
                              'Rubik',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.185,
                              letterSpacing: 0.3,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            data['cardnumber'],
                            style: SafeGoogleFont(
                              'Rubik',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.185,
                              letterSpacing: 0.3,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date",
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.185,
                            letterSpacing: 0.3,
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              data['month'],
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.185,
                                letterSpacing: 0.3,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              "/",
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.185,
                                letterSpacing: 0.3,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              data['year'],
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.185,
                                letterSpacing: 0.3,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: Container(
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVV",
                            style: SafeGoogleFont(
                              'Rubik',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.185,
                              letterSpacing: 0.3,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            data['cvv'],
                            style: SafeGoogleFont(
                              'Rubik',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.185,
                              letterSpacing: 0.3,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Text("loading");
            },
          ),
        ],
      ),
    );
  }
}
