import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/seller/main_section/pages/seller_edit_pages.dart';
import 'package:mylittlebakery/users/pages/edit_user_profile_screen.dart';
import 'package:mylittlebakery/users/pages/noti/notifications.dart';
import 'package:mylittlebakery/widgets/user_drawer.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class UsersProfileScreen extends StatefulWidget {
  const UsersProfileScreen({super.key});

  @override
  State<UsersProfileScreen> createState() => _UsersProfileScreenState();
}

class _UsersProfileScreenState extends State<UsersProfileScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: UserDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 3,
          title: Text(
            "Profile Screen",
            style: TextStyle(color: Colors.black),
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
            Builder(builder: (context) {
              return IconButton(
                  onPressed: _openEndDrawer,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ));
            })
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              var document = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 110,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(document['photoURL']),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    document['name'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => EditUserScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xffFECEC1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Edit Profile"),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Email
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 18, top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 39,
                        height: 17,
                        child: Text(
                          'Email',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 170,
                        height: 20,
                        child: Text(
                          document['email'],
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0x82000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Phone Number
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 129,
                        height: 17,
                        child: Text(
                          'Phone Number',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 130,
                        height: 20,
                        child: Text(
                          document['phoneNumber'],
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0x82000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //User Name
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5, top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 80,
                        height: 17,
                        child: Text(
                          'Address',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 150,
                        height: 20,
                        child: Text(
                          document['address'],
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0x82000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Password
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 90,
                        height: 17,
                        child: Text(
                          'Password',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 50,
                        height: 20,
                        child: Text(
                          '********',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.28,
                            color: Color(0x82000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
