import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mylittlebakery/database/firebase_storage.dart';
import 'package:mylittlebakery/models/gigs_models.dart';
import 'package:uuid/uuid.dart';

class FirebaseMethods {
  //Gig Create
  Future<String> gigPost(
      {required Uint8List file,
      required String description,
      required String uid,
      required String itemName,
      required String categoryName,
      required String price,
      required List<File> multiImages}) async {
    String res = "Some Error";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage("gigImage", file, true);

      String gigId = Uuid().v1();
      Gig_Model gig_model = Gig_Model(
          description: description,
          uid: uid,
          itemName: itemName,
          categoryName: categoryName,
          price: price,
          photoURL: photoUrl,
          multiImages: []);

      ///Uploading Post To Firebase
      FirebaseFirestore.instance
          .collection('gigs')
          .doc(gigId)
          .set(gig_model.toJson());
      res = 'Sucessfully Uploaded in Firebase';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
