import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mylittlebakery/seller/main_section/mainscreen.dart';
import 'package:mylittlebakery/widgets/snak.dart';
import 'package:path/path.dart' as Path;
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GigImages extends StatefulWidget {
  const GigImages({Key? key}) : super(key: key);

  @override
  State<GigImages> createState() => _GigImagesState();
}

class _GigImagesState extends State<GigImages> {
  var phoneNumberController = TextEditingController();
  List<bool> enabled = [false, false, false, false, false, false];

  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;

  List<File> _image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                "Add Gig Photos",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add at least one gig  photo to showcase in your gig or maximum three photos. ",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: [
                      SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              child: GridView.builder(
                                  itemCount: _image.length + 1,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        ? Center(
                                            child: IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () => !uploading
                                                    ? chooseImage()
                                                    : null),
                                          )
                                        : Container(
                                            margin: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        _image[index - 1]),
                                                    fit: BoxFit.cover)),
                                          );
                                  }),
                            ),
                            uploading
                                ? Center(
                                    child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Text(
                                          'uploading...',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CircularProgressIndicator(
                                        value: val,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.green),
                                      )
                                    ],
                                  ))
                                : Container(),
                          ],
                        ),
                      ),
                      // for (int i = 0; i < 6; i++)
                      //   utils.addPhotosWidget(
                      //     onTap: () async {
                      //       if (enabled[i] == true) {
                      //         enabled[i] = false;
                      //       } else {
                      //         await Navigator.pushNamed(
                      //             context, editPhotosScreenRoute);
                      //         enabled[i] = true;
                      //       }
                      //       setState(() {});
                      //     },
                      //     enabled: enabled[i],
                      //     width: width,
                      //   ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width > 415
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Tip: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "ProximaNova",
                                  color: blueColor,
                                ),
                              ),
                              Text(
                                "Try to show off your",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ProximaNova",
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "portfolio in your photos.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "ProximaNova",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  gradientBigButton(
                    onTap: () {
                      // if (enabled[0] == true ||
                      //     enabled[1] == true ||
                      //     enabled[2] == true ||
                      //     enabled[3] == true ||
                      //     enabled[4] == true ||
                      //     enabled[5] == true) {
                      //   Navigator.pushNamed(
                      //       context, onBoardingPhotoVerificationScreenRoute);
                      // }
                      if (_image.length <= 3) {
                        setState(() {
                          uploading = true;
                        });
                        uploadFile().whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => SellerMainScreen()));
                        });
                      } else {
                        Fluttertoast.showToast(
                            msg: "Your Images are not stored",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    width: MediaQuery.of(context).size.width * 0.3,
                    text: "Continue",
                    enabled: enabled.contains(true) ? false : true,
                    textColor:
                        enabled.contains(true) ? Colors.white : Colors.black,
                    borderRadius: 8.0,
                    shadowColors: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  var as = Uuid().v1();

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref!.putFile(img).whenComplete(() async {
        await ref!.getDownloadURL().then((value) {
          var id = Uuid().v1();
          FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("images")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "uid": FirebaseAuth.instance.currentUser!.uid,
            'multiImages': FieldValue.arrayUnion([value])
          });
          // imgRef!.add({'url': value});
          i++;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }
}
