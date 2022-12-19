import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylittlebakery/users/pages/orders/orders_user_started.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class SpecificGigDetail extends StatefulWidget {
  String? id;
  String? name;
  String? categoryName;
  String? itemName;
  List<dynamic>? multiImages;
  String? description;
  String? photoURL;
  String? price;
  SpecificGigDetail(
      {Key? key,
      this.id,
      this.name,
      this.categoryName,
      this.multiImages,
      this.itemName,
      this.photoURL,
      this.price,
      this.description})
      : super(key: key);

  @override
  State<SpecificGigDetail> createState() => _SpecificGigDetailState();
}

class _SpecificGigDetailState extends State<SpecificGigDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 204,
            child: Stack(
              children: [
                Container(
                  height: 204,
                  // autogroupwjrkhXz (55J6mQHSreCQ7n2AB2Wjrk)
                  padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.photoURL!),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // ionarrowbackcircleoutlineaQk (19:97)
                      width: 26.25,
                      height: 26.25,
                      child: Image.asset(
                        'assets/ion-arrow-back-circle-outline-X4Y.png',
                        width: 26.25,
                        height: 26.25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                // autogroupcjauYwE (55JBKBsaZvbLBGivsEcjaU)
                width: double.infinity,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // itemnameGsE (19:39)
                      margin: EdgeInsets.fromLTRB(0, 0, 108, 0),
                      child: Text(
                        widget.itemName!,
                        style: SafeGoogleFont(
                          'Rubik',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          height: 1.185,
                          letterSpacing: 0.5,
                          color: Color(0xfffecec1),
                        ),
                      ),
                    ),
                    Container(
                      // group1000003927Mdn (19:245)
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // priceTwi (19:42)
                            margin: EdgeInsets.fromLTRB(0, 2, 12, 0),
                            child: Text(
                              'Price',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.185,
                                letterSpacing: 0.36,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupdm1n9Ze (55JBbgQ6knQVf1tXeyDm1N)
                            width: 30,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xfffecec1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                '\$' + widget.price!,
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185,
                                  letterSpacing: 0.2,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogrouposzgzKN (55JBTGUT6SGYjKR5R1oSzg)
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.favorite,
                        color: Color(0xffFECEC1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupnvgt6dJ (55JCJQjEXBFJnu8a63Nvgt)
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogroupxsacQdz (55JBjqqAZkhPoUXW8HxsaC)
                      margin: EdgeInsets.fromLTRB(0, 0, 1, 7),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // categoryKFA (19:40)
                            margin: EdgeInsets.fromLTRB(0, 0, 174, 4),
                            child: Text(
                              widget.categoryName!,
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.185,
                                letterSpacing: 0.36,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // group10000039591Nt (111:10)
                              // padding: EdgeInsets.fromLTRB(1.3, 0, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBarIndicator(
                                    // rating: _userRating,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Color(0xffFF0000),
                                    ),
                                    itemCount: 1,
                                    itemSize: 20.0,
                                    unratedColor: Color(0xffFF0000),
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    // ftg (19:41)
                                    '4.5',
                                    style: SafeGoogleFont(
                                      'Rubik',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7, left: 20, right: 20),
                child: Divider(
                  color: Color(0xffFECEC1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                // categoryKFA (19:40)
                child: Text(
                  widget.description!,
                  style: SafeGoogleFont(
                    'Rubik',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.185,
                    letterSpacing: 0.36,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7, left: 20, right: 20),
                child: Divider(
                  color: Color(0xffFECEC1),
                ),
              ),
              Container(
                // allitems8V2 (35:205)
                child: Text(
                  'Items you also like?',
                  textAlign: TextAlign.left,
                  style: SafeGoogleFont(
                    'Rubik',
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    height: 1.32,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.6,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("gigs")
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
                            Map<String, dynamic> snap =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (builder) => SpecificGigDetail(
                                // id: snap['uid'],
                                // categoryName: snap['categoryName'],
                                // multiImages: snap['multiImages'],
                                // itemName: snap['itemName'],
                                // description: snap['description'],
                                // photoURL: snap['photoURL'],
                                // price: snap['price'],
                                //             )));
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                          color:
                                                              Color(0xff000000),
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
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite_outline,
                                                      color: Colors.pink,
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => OrdersStarted(
                                id: widget.id,
                                categoryName: widget.categoryName,
                                itemName: widget.itemName,
                                description: widget.description,
                                photoURL: widget.photoURL,
                                price: widget.price,
                              )));
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFECEC1),
                    fixedSize: Size(306, 60),
                    shape: StadiumBorder()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
