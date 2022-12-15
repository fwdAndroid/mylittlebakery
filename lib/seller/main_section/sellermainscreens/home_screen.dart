import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://banner2.cleanpng.com/20180612/hv/kisspng-computer-icons-designer-avatar-5b207ebb279901.8233901115288562511622.jpg"),
        ),
        elevation: 3,
        title: Text(
          "Devis brown",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffFECEC1), shape: BoxShape.circle),
              child: Center(
                  child: Text(
                "4.5",
                style: GoogleFonts.getFont("Roboto",
                    fontSize: 15, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
              child: Text(
            "Positive Rating",
            style: GoogleFonts.getFont("Roboto",
                fontSize: 15, fontWeight: FontWeight.w600),
          )),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              "Earnings",
              style: GoogleFonts.getFont(
                "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // group238u3i (22:110)
            margin: EdgeInsets.fromLTRB(7 * fem, 0 * fem, 8 * fem, 20 * fem),
            padding:
                EdgeInsets.fromLTRB(28 * fem, 27 * fem, 28 * fem, 25 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0x1e000000)),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(20 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogrouppmssZtx (55LZRZ5dfdLXRrEAPkpMsS)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 29 * fem),
                  width: double.infinity,
                  height: 45 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group234gig (22:112)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 24 * fem, 0 * fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // personalbalance1FA (22:113)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              child: Text(
                                'Personal balance',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  color: Color(0xfffecec1),
                                ),
                              ),
                            ),
                            Text(
                              // WSp (22:114)
                              '\$45',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.185 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group235F9W (22:115)
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // earninginjunenfE (22:116)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              child: Text(
                                'Earning in june',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  color: Color(0xfffecec1),
                                ),
                              ),
                            ),
                            Text(
                              // 6A8 (22:117)
                              '\$45',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.185 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupanrap68 (55La4HXRozea5v6YWiANRA)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14 * fem, 0 * fem),
                  width: double.infinity,
                  height: 45 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group236jD6 (22:118)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 69 * fem, 0 * fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // totalorderseqr (22:119)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              child: Text(
                                'Total orders',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  color: Color(0xfffecec1),
                                ),
                              ),
                            ),
                            Text(
                              // m9n (22:120)
                              '23',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.185 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group238JQc (22:121)
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // activeordersFKr (22:122)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              child: Text(
                                'Active orders',
                                style: SafeGoogleFont(
                                  'Rubik',
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.185 * ffem / fem,
                                  color: Color(0xfffecec1),
                                ),
                              ),
                            ),
                            Text(
                              // ABv (22:123)
                              '0',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.185 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              "My Items",
              style: GoogleFonts.getFont(
                "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 345 * fem,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, Index) {
                  return Container(
                    // group1000003866QMA (22:124)
                    margin: EdgeInsets.fromLTRB(
                        7 * fem, 0 * fem, 8 * fem, 10 * fem),
                    padding: EdgeInsets.fromLTRB(
                        14 * fem, 28 * fem, 20 * fem, 21 * fem),
                    width: double.infinity,
                    height: 150 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1e000000)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Container(
                      // group234gJg (22:129)
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroup9ue4pfn (55LbTzgHCABF8vR79V9uE4)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 5 * fem),
                            width: double.infinity,
                            height: 42 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // rectangle346248878wN (22:132)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 10 * fem, 0 * fem),
                                  width: 40 * fem,
                                  height: 40 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffd9d9d9),
                                  ),
                                ),
                                Container(
                                  // autogroupa5gxrMa (55LbqKQ5qdg12cQdUnA5Gx)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 107 * fem, 0 * fem),
                                  width: 133 * fem,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // servicenamemzL (22:130)
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 133 * fem,
                                            height: 24 * fem,
                                            child: Text(
                                              'Service Name',
                                              style: SafeGoogleFont(
                                                'Rubik',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.185 * ffem / fem,
                                                color: Color(0xfffecec1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // category4Ck (22:131)
                                        left: 0 * fem,
                                        top: 23 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 69 * fem,
                                            height: 19 * fem,
                                            child: Text(
                                              'Category',
                                              style: SafeGoogleFont(
                                                'Rubik',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.185 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  // MSk (22:140)
                                  '\$10',
                                  style: SafeGoogleFont(
                                    'Rubik',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.185 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // loremipsumdolorsitametconsecte (22:139)
                            constraints: BoxConstraints(
                              maxWidth: 318 * fem,
                            ),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Adipiscing libero dui egestas commodo turpis egestas. Diam est mauris consequat augue.',
                              style: SafeGoogleFont(
                                'Rubik',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.185 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
