import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylittlebakery/seller/gigs/edit_gigs.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class GigDetail extends StatefulWidget {
  final categoryname;
  final price;
  final description;
  final photoUrl;
  final id;

  GigDetail(
      {super.key,
      required this.categoryname,
      required this.price,
      required this.description,
      required this.id,
      required this.photoUrl});

  @override
  State<GigDetail> createState() => _GigDetailState();
}

class _GigDetailState extends State<GigDetail> {
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
          "Description",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => EditGig()));
            },
            child: Container(
              // autogroup8g4lwk8 (55LhzixtWhaDz9c7pa8g4L)
              margin: EdgeInsets.fromLTRB(298, 0, 2.83, 18),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // edit4Zr (22:655)
                    margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                    child: Text(
                      'Edit',
                      style: SafeGoogleFont(
                        'Rubik',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.185,
                        letterSpacing: 0.4,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // materialsymbolseditsquarewtY (22:653)
                    width: 34.17,
                    height: 34.21,
                    child: Image.asset(
                      'assets/material-symbols_edit-square.png',
                      width: 34.17,
                      height: 34.21,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // group10000039213At (22:544)
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
            padding: EdgeInsets.fromLTRB(1.3, 0, 0, 0),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // autogroupyphwLQt (55LjSMEDRRFbgefggryPHW)
                  margin: EdgeInsets.fromLTRB(0, 0, 61, 0),
                  width: 138.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // itemnameqcY (22:545)
                        margin: EdgeInsets.fromLTRB(0.7, 0, 0, 12),
                        child: Text(
                          'Item Name',
                          style: SafeGoogleFont(
                            'Rubik',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            height: 1.185,
                            letterSpacing: 0.5,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // categoryWya (22:546)
                        margin: EdgeInsets.fromLTRB(0.7, 0, 0, 13),
                        child: Text(
                          widget.categoryname,
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
                        // autogroupxzzc7Ta (55Lk7QwTWdnkxH1Cf3xZzc)
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Text(
                              // rLc (22:547)
                              '4.5',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.185,
                                letterSpacing: 0.36,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group1000003927B7z (22:558)
                        margin: EdgeInsets.fromLTRB(1.7, 0, 17, 0),
                        width: double.infinity,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // priceTrC (22:559)
                              margin: EdgeInsets.fromLTRB(0, 2, 45, 0),
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
                              // autogroupwkr8ZeL (55Lm73x5tBX9Xy8yVaWkr8)
                              width: 30,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff000000),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    "\$" + widget.price,
                                    style: SafeGoogleFont(
                                      'Rubik',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      height: 1.185,
                                      letterSpacing: 0.2,
                                      color: Color(0xffffffff),
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
                Container(
                  // rectangle20iQk (22:566)
                  width: 180,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // group1000003923AGk (22:570)
            margin: EdgeInsets.fromLTRB(0, 0, 1.95, 0),
            padding: EdgeInsets.fromLTRB(2, 20, 2, 0),
            width: 379.05,
            child: SizedBox(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 373,
                ),
                child: Text(
                  widget.description,
                  style: SafeGoogleFont(
                    'Rubik',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.185,
                    letterSpacing: 0.4,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          // 0xfffecec1
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Remove",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    0xfffecec1,
                  ),
                  shape: StadiumBorder(),
                  fixedSize: Size(306, 58)),
            ),
          )
        ],
      ),
    );
  }
}
