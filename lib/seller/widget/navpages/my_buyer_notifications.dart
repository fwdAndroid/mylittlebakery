import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Buyer_Notificatios extends StatefulWidget {
  const Buyer_Notificatios({super.key});

  @override
  State<Buyer_Notificatios> createState() => _Buyer_NotificatiosState();
}

class _Buyer_NotificatiosState extends State<Buyer_Notificatios> {
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
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("orders").snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('No Notification'),
              );
            }

            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      documentSnapshot['photoURL']),
                                ),
                                // onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (builder) =>
                                //               vIEWd(
                                //                 age: documentSnapshot[
                                //                     'age'],
                                //                 id: documentSnapshot[
                                //                     'id'],
                                //                 date: documentSnapshot[
                                //                     'date'],
                                //                 name: documentSnapshot[
                                //                     'name'],
                                //                 problem: documentSnapshot[
                                //                     'problem'],
                                //               )));
                                // },
                                title: Text("Order Description"),
                                subtitle: Text(documentSnapshot['description']),
                                trailing: Text(documentSnapshot['status']),
                              ),
                              Divider()
                            ],
                          );
                        }),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
    );
    ;
  }
}
