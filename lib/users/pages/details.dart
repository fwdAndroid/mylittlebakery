import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/database/Firebase_database.dart';
import 'package:mylittlebakery/users/main/pages/user_chat_page.dart';
import 'package:mylittlebakery/users/pages/specifcgigdetail.dart';
import 'package:mylittlebakery/widgets/like_animation.dart';
import 'package:mylittlebakery/widgets/utils.dart';
import 'package:uuid/uuid.dart';

class Details extends StatefulWidget {
  String? id;
  String? categoryName;
  String? itemName;
  List<dynamic>? multiImages;
  String? description;
  String? photoURL;
  String? price;
  String? name;
  Details(
      {Key? key,
      this.id,
      this.categoryName,
      this.multiImages,
      this.name,
      this.itemName,
      this.photoURL,
      this.price,
      this.description})
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var id = Uuid().v1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        elevation: 3,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(9),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Sellerinfo")
                .doc(widget.id)
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Sellerinfo")
                    .doc(widget.id)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return new CircularProgressIndicator();
                  }
                  var document = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 110,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage:
                                  NetworkImage(document['photoURL']),
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
                    ],
                  );
                }),
          ),
          Container(
            // autogroupwmntVwr (55KDtwvmrNBLBkKbuDwmnt)
            margin: EdgeInsets.fromLTRB(2, 0, 5, 10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // allitems8V2 (35:205)
                  margin: EdgeInsets.fromLTRB(0, 1, 159, 0),
                  child: Text(
                    'All Items',
                    style: SafeGoogleFont(
                      'Rubik',
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 1.32,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => UserChatPage(
                                buyername: widget.name.toString(),
                                username: widget.name.toString())));
                    //Username
                    // FirebaseMethods().addChatMembers(
                    //     username: username,
                    //     uid: FirebaseAuth.instance.currentUser!.uid,
                    //     buyername: document,
                    //     uuid: id,
                    //     buyerid: widget.id!);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) => UserChatPage(
                    //           username: FirebaseAuth.instance.currentUser!.uid,
                    //           buyername: widget.id!,
                    //         )));
                  },
                  child: Container(
                    // group1000003956Fi4 (35:1646)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                    padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // letschatf16 (35:1645)
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            'Let’s chat',
                            style: SafeGoogleFont(
                              'Rubik',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 2.2,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // bxmessagesquaredotsFEC (35:1641)
                          width: 20,
                          height: 19,
                          child: Image.asset(
                            'assets/bx-message-square-dots-vu2.png',
                            width: 20,
                            height: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("gigs")
                    .doc("details")
                    .collection("records")
                    .snapshots(),
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
                                    builder: (builder) => SpecificGigDetail(
                                          id: snap['uid'],
                                          name: snap['name'],
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
                                            LikeAnimation(
                                              isAnimating: snap['likes'],
                                              smallLike: true,
                                              child: IconButton(
                                                onPressed: () async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("gigs")
                                                      .doc(snap['uuid'])
                                                      .update({"likes": true});
                                                },
                                                icon: snap['likes']
                                                    ? Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      )
                                                    : Icon(
                                                        Icons.favorite,
                                                        color: Colors.black,
                                                      ),
                                              ),
                                            ),
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
        ],
      ),
    );
  }
}
