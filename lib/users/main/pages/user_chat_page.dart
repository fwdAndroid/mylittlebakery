import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserChatPage extends StatefulWidget {
  String? username;
  String? id;
  UserChatPage({super.key,  this.id,  this.username});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Messages",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("gigs")
                      .doc("details")
                      .collection("records")
                      .where("uid", isEqualTo: widget.id)
                      .snapshots(includeMetadataChanges: true),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    }

                    if (snapshot.hasData) {
                      print(FirebaseAuth.instance.currentUser!.uid);

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, int index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return InkWell(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     CupertinoPageRoute(builder: (context) {
                                  //   return ChatRoom(
                                  //     doctorName: documentSnapshot['doctorName'],
                                  //     paitientid: documentSnapshot['id'],
                                  //     doctorId: documentSnapshot['doctorid'],
                                  //     paitientname: documentSnapshot['name'],
                                  //     // user : widget.doctorid,
                                  //   );
                                  // }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                documentSnapshot['photoURL']),
                                          ),
                                          title: Text(documentSnapshot['name'],
                                              style: TextStyle(
                                                  color: Color(0xff858585),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                        )),
                                    Divider()
                                  ],
                                ));
                          });
                    } else {
                      return Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
