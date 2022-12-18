import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/users/pages/details.dart';
import 'package:mylittlebakery/users/pages/drawer_user/favourite.dart';
import 'package:mylittlebakery/users/pages/noti/notifications.dart';
import 'package:mylittlebakery/widgets/user_drawer.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int isliked = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: UserDrawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              var document = snapshot.data;
              return CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(document['photoURL']));
            },
          ),
          elevation: 3,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.all(9),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return new CircularProgressIndicator();
                }
                var document = snapshot.data;
                return Text(
                  (document['name']),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                );
              },
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Notificatios()));
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                  UserDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 1),
                  blurRadius: 7,
                ),
              ],
            ),
            child: Opacity(
              opacity: 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,

                  // searchitemug8 (1:86)
                  hintText: 'Search item',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: SafeGoogleFont(
                    'Rubik',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.185,
                    letterSpacing: -0.2399999946,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 1),
                  blurRadius: 7,
                ),
              ],
            ),
            child: Opacity(
              opacity: 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // searchitemug8 (1:86)
                  hintText: 'Search nearby bakery',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  hintStyle: SafeGoogleFont(
                    'Rubik',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.185,
                    letterSpacing: -0.2399999946,
                    color: Color.fromARGB(255, 196, 167, 167),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("gigs").snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 14 / 10,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext ctx, index) {
                        Map<String, dynamic> snap = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Details(
                                          id: snap['uid'],
                                          categoryName: snap['categoryName'],
                                          multiImages: snap['multiImages'],
                                          itemName: snap['itemName'],
                                          description: snap['description'],
                                          photoURL: snap['photoURL'],
                                          price: snap['price'],
                                        )));
                          },
                          child: Container(
                            width: 175,
                            height: 260,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(
                                  snap['photoURL'],
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 10,
                                  left: 25,
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFECEC1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "4.0",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 21,
                                  top: 90,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    snap['itemName'],
                                                    style: SafeGoogleFont(
                                                      'Rubik',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Text(
                                                    snap['categoryName'],
                                                    style: SafeGoogleFont(
                                                      'Rubik',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("gigs")
                                                      .doc(snap["uuid"])
                                                      .update({"likes": true});
                                                  setState(() {
                                                    isliked = 1;
                                                  });
                                                },
                                                icon: Icon(
                                                  isliked == 0
                                                      ? Icons.favorite_outline
                                                      : Icons.favorite,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ]));
  }
}
