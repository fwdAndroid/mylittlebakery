import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlebakery/widgets/user_chat_room.dart';

class UserChatPage extends StatefulWidget {
  final uid;
  final buyerName;
  final PhotoUrl;
  UserChatPage({Key? key, this.PhotoUrl, this.buyerName, this.uid})
      : super(key: key);

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
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
        backgroundColor: Colors.white,
        elevation: 3,
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
                      .collection("chats")
                      .doc("chat_messages")
                      .collection("message")
                      .where("uuid", isEqualTo: widget.uid)
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
                                                        ds.get("buyerName"),
                                                    receiverId: ds.id,
                                                    receiverimageLink:
                                                        ds.get("photourl"),
                                                  )));
                                      // Navigator.pushNamed(this.context, MaterialPageRoute(builder: (builder) => UserChatPagePage()));
                                    },
                                    leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(ds.get("photourl"))),
                                    title: Text(ds.get("buyerName")),
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
