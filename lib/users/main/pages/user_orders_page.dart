import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylittlebakery/users/pages/noti/notifications.dart';
import 'package:mylittlebakery/users/pages/orders/completed_orders_screen.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class UsersOrders extends StatefulWidget {
  @override
  State<UsersOrders> createState() => _UsersOrdersState();
}

class _UsersOrdersState extends State<UsersOrders> {
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
          "My Orders",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Notificatios()));
              },
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
      body: SingleChildScrollView(
        child: FirebaseAuth.instance.currentUser != null
            ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    // .where(
                    //   'status',
                    //   isNotEqualTo: 'pending',
                    // )
                    .where(
                      'status',
                      isEqualTo: "accepted",
                    )
                    .where('uid',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('No Data'),
                    );
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     '29 Decemeber 2002',
                        //     textAlign: TextAlign.start,
                        //     style:
                        //         TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                        //   ),
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                Map<String, dynamic> snap =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x21000000),
                                              offset: Offset(2, 2),
                                              blurRadius: 8.5,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      width: 362,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (builder) =>
                                              //         AppointCurrentDetail(),
                                              //   ),
                                              // );
                                            },
                                            leading: Image.network(
                                              snap['photoURL'],
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.cover,
                                            ),
                                            title: Text(
                                              snap['itemName'],
                                              style: SafeGoogleFont(
                                                'Rubik',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                height: 1.185,
                                                letterSpacing: 0.3,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            subtitle: Text(
                                              // categoryVWc (19:908)
                                              snap['description'],
                                              style: SafeGoogleFont(
                                                'Rubik',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                height: 1.185,
                                                letterSpacing: 0.3,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            trailing: FittedBox(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    ' \$ ' + snap['price'],
                                                    style: SafeGoogleFont(
                                                      'Rubik',
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.185,
                                                      letterSpacing: 0.4,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      FirebaseFirestore.instance
                                                          .collection("orders")
                                                          .doc(snap['uuid'])
                                                          .update({
                                                        "status": "completed"
                                                      }).then((value) {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (builder) =>
                                                                        OrdersCompleted(
                                                                          // uuid:
                                                                          //     snap['uuid'],
                                                                          id: snap[
                                                                              'id'],
                                                                          itemName:
                                                                              snap['itemName'],
                                                                          description:
                                                                              snap['description'],
                                                                          photoURL:
                                                                              snap['photoURL'],
                                                                          price:
                                                                              snap['price'],
                                                                          name:
                                                                              snap['name'],
                                                                          categoryName:
                                                                              snap['categoryName'],
                                                                        )));
                                                      });
                                                    },
                                                    child: Text(
                                                      "Mark as Complete",
                                                      style: SafeGoogleFont(
                                                        'Rubik',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.185,
                                                        letterSpacing: 0.3,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            // autogroup3wyngDi (55JQut3kd66HNYaoQT3wyn)
                                            width: double.infinity,
                                            height: 55,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // group1000003872NcL (19:913)
                                                  left: 0,
                                                  top: 0,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 340,
                                                      height: 55,
                                                      child: Divider(
                                                        color:
                                                            Color(0xffFECEC1),
                                                        height: 55,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ordered3Cg (19:919)
                                                  left: 6,
                                                  top: 5,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 59,
                                                      height: 18,
                                                      child: Text(
                                                        'Ordered',
                                                        style: SafeGoogleFont(
                                                          'Rubik',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.185,
                                                          letterSpacing: 0.3,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                })
            : const Center(
                child: Text('No Active Orders Pending'),
              ),
      ),
    );
  }
}
