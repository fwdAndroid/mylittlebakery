import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylittlebakery/user_selection.dart';
import 'package:mylittlebakery/users/main/pages/user_profile_screen.dart';
import 'package:mylittlebakery/users/pages/drawer_user/favourite.dart';
import 'package:mylittlebakery/users/pages/drawer_user/myorders.dart';
import 'package:mylittlebakery/users/pages/drawer_user/transactions.dart';
import 'package:mylittlebakery/users/pages/noti/notifications.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    // UserModel user = Provider.of<UserProvider>(context).getUser;

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
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
                title: StreamBuilder(
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
                subtitle: Text("View Profile"),
              )),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Image.asset("assets/icon-park-outline_transaction-order.png"),
            ),
            title: const Text(
              'My Orders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => const MyOrders(),
                ),
              );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/ant-design_heart-filled.png"),
            ),
            title: const Text(
              'Favourite',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) =>  Favourite(),
                ),
              );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/carbon_notification-filled.png"),
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => const Notificatios(),
                ),
              );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/ant-design_setting-outlined.png'),
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => UsersProfileScreen()));
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/Vector.png'),
            ),
            title: const Text(
              'Transactions',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => Transactions()));
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          Container(
            height: 50,
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => UserSelection()));
              });
            },
            child: Container(
              height: 59,
              decoration: BoxDecoration(color: Color(0xffFECEC1)),
              child: Center(
                child: Text(
                  "Log out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
