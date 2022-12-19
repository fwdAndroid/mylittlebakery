import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
        elevation: 3,
        centerTitle: true,
        title: Padding(
            padding: EdgeInsets.all(9),
            child: Text(
              "Favourite",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("gigs")
                    .doc("details")
                    .collection('details')
                    .where("likes", isEqualTo: true)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext ctx, index) {
                        Map<String, dynamic> snap = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return InkWell(
                          onTap: () {},
                          child: Container(
                              width: MediaQuery.of(context).size.height,
                              height: 100,
                              child: Card(
                                child: ListTile(
                                  leading: Image.network(
                                    snap['photoURL'],
                                    fit: BoxFit.cover,
                                    width: 100,
                                  ),
                                  title: SizedBox(
                                    child: Text(
                                      snap['itemName'],
                                      style: SafeGoogleFont(
                                        'Rubik',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          snap['categoryName'],
                                          style: SafeGoogleFont(
                                            'Rubik',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Text(snap['description'])
                                    ],
                                  ),
                                  trailing: InkWell(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection("gigs")
                                          .doc(snap["uuid"])
                                          .update({"likes": false});
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Color(0xffFECEC1),
                                    ),
                                  ),
                                ),
                              )),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
