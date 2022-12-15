import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://banner2.cleanpng.com/20180612/hv/kisspng-computer-icons-designer-avatar-5b207ebb279901.8233901115288562511622.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              "David Camp",
              style: GoogleFonts.getFont(
                "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 40,
            width: 110,
            decoration: BoxDecoration(
                color: Color(0xffFECEC1),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Text("Edit Profile"), Icon(Icons.arrow_forward_ios)],
              ),
            ),
          ),
          //Email
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 15),
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
                  'fwdKaleem@gmail.com',
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
                width: 139,
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
            margin: EdgeInsets.only(left: 15, top: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 170,
                height: 20,
                child: Text(
                  'fwdKaleem@gmail.com',
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
                width: 100,
                height: 17,
                child: Text(
                  'User Name',
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
                  'fwdKaleem@gmail.com',
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
          //Address
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
                width: 170,
                height: 20,
                child: Text(
                  'fwdKaleem@gmail.com',
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
                width: 170,
                height: 20,
                child: Text(
                  'fwdKaleem@gmail.com',
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
      ),
    );
  }
}
