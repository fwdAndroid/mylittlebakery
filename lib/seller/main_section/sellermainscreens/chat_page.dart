import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlebakery/widgets/user_chat_room.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  // fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color(0xfffee6c1)),
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
