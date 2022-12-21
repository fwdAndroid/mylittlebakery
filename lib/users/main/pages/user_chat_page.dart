import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlebakery/widgets/user_chat_room.dart';

class UserChatPage extends StatefulWidget {
  UserChatPage({Key? key}) : super(key: key);

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffee6c1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Messages',
          style: TextStyle(color: Colors.black),
        ),
      ),
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
                      .where("type", isEqualTo: "Seller")
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
                                                        ds.get("buyerUserName"),
                                                    receiverId: ds.id,
                                                    receiverimageLink:
                                                        ds.get("photoURL"),
                                                  )));
                                      // Navigator.pushNamed(this.context, MaterialPageRoute(builder: (builder) => UserChatPagePage()));
                                    },
                                    leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(ds.get("photoURL"))),
                                    title: Text(ds.get("email")),
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
