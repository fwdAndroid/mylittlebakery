import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlebakery/seller/widget/buyer_gigs.dart';
import 'package:mylittlebakery/seller/widget/navpages/my_buyer_notifications.dart';
import 'package:mylittlebakery/widgets/user_chat_room.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void _openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xfffee6c1),
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
        centerTitle: true,
        elevation: 3,
        title: Padding(
            padding: EdgeInsets.all(9),
            child: Text(
              ("Messages"),
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => Buyer_Notificatios()));
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
      endDrawer: BuyerDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .where("type", isEqualTo: "User")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var ds = snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          this.context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  ChatUserRoom(
                                                    receiverName:
                                                        ds.get("name"),
                                                    receiverId: ds.id,
                                                    receiverimageLink:
                                                        ds.get("photoURL"),
                                                  )));
                                      // Navigator.pushNamed(this.context, MaterialPageRoute(builder: (builder) => ChatPagePage()));
                                    },
                                    leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(ds.get("photoURL"))),
                                    title: Text(ds.get("name")),
                                  ),
                                  Divider()
                                ],
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
