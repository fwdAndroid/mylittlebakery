import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylittlebakery/database/Firebase_database.dart';
import 'package:mylittlebakery/seller/main_section/mainscreen.dart';
import 'package:mylittlebakery/users/main/user_main_screen.dart';
import 'package:mylittlebakery/widgets/snak.dart';
import 'package:mylittlebakery/widgets/utils.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.clear();
    _phonecontroller.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return new CircularProgressIndicator();
                }

                var document = snapshot.data;
                _phonecontroller.text = document['phoneNumber'];
                _emailController.text = document['email'];
                _addressController.text = document['address'];
                // items = document['gender'] as List<String>;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            text: 'Update Email',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 7 * fem, 17 * fem),

                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              offset: Offset(0 * fem, 0 * fem),
                              blurRadius: 5 * fem,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _emailController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hintText: document['email'],
                            hintStyle: SafeGoogleFont(
                              'Rubik',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.185 * ffem / fem,
                              letterSpacing: 0.32 * fem,
                              color: Color(0x7f000000),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            text: 'Address',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 7 * fem, 17 * fem),

                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              offset: Offset(0 * fem, 0 * fem),
                              blurRadius: 5 * fem,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _addressController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hintText: document['address'],
                            hintStyle: SafeGoogleFont(
                              'Rubik',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.185 * ffem / fem,
                              letterSpacing: 0.32 * fem,
                              color: Color(0x7f000000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            text: 'Phone Number',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // autogroupwmgqS8L (55KsCsm8J9YQmahsyJWmGQ)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 7 * fem, 17 * fem),

                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              offset: Offset(0 * fem, 0 * fem),
                              blurRadius: 5 * fem,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _phonecontroller,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hintText: document['phoneNumber'],
                            hintStyle: SafeGoogleFont(
                              'Rubik',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.185 * ffem / fem,
                              letterSpacing: 0.32 * fem,
                              color: Color(0x7f000000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFECEC1).withOpacity(.6),
                            fixedSize: const Size(350, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: EditUserScreen,
                          child: _isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : Text(
                                  'Confrim',
                                  style: GoogleFonts.getFont('Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal),
                                ),
                        ),
                      ),
                    ]);
              }),
        ));
  }

  EditUserScreen() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseMethods().updateUserProfile(
      phoneNumber: _phonecontroller.text,
      email: _emailController.text,
      address: _addressController.text,
      uid: FirebaseAuth.instance.currentUser!.uid,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'success') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => UserMainScreen(),
        ),
      );
    } else {
      showSnakBar(rse, context);
    }
  }
}
