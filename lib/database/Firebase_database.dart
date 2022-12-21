import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mylittlebakery/database/firebase_storage.dart';
import 'package:mylittlebakery/models/chat_model.dart';
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
      required bool likes,
      required String name,
      required String uuid,
      required List<File> multiImages}) async {
    String res = "Some Error";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage("gigImage", file, true);

      String gigId = Uuid().v1();
      Gig_Model gig_model = Gig_Model(
          name: name,
          description: description,
          uid: uid,
          itemName: itemName,
          categoryName: categoryName,
          price: price,
          photoURL: photoUrl,
          uuid: gigId,
          likes: [],
          multiImages: []);

      ///Uploading Post To Firebase
      FirebaseFirestore.instance
          .collection('gigs')
          .doc("details")
          .collection("records")
          .doc(gigId)
          .set(gig_model.toJson());
      res = 'Sucessfully Uploaded in Firebase';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //Likes
  ///Likes Post
  Future<void> likePosts(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await FirebaseFirestore.instance
            .collection('gigs')
            .doc("details")
            .collection("records")
            .doc(postId)
            .update({
          "likes": FieldValue.arrayRemove([uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('gigs')
            .doc("details")
            .collection("records")
            .doc(postId)
            .update({
          "likes": FieldValue.arrayUnion([uid])
        });
      }
    } catch (E) {
      print(E.toString());
    }
  }

  //Update Gigs
  Future<String> gigUpdat({
    required Uint8List file,
    required String description,
    required String itemName,
    required String categoryName,
    required String price,
    required String uuid,
  }) async {
    String res = "Some Error";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage("gigImage", file, true);

      String gigId = Uuid().v1();

      ///Uploading Post To Firebase
      FirebaseFirestore.instance
          .collection('gigs')
          .doc("details")
          .collection("records")
          .doc(gigId)
          .update({});
      res = 'Sucessfully Uploaded in Firebase';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //Update Buyer Profile
  Future<String> updateProfile({
    required String email,
    required String uid,
    required String address,
    required String phoneNumber,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || address.isNotEmpty) {
        //Add User to the database with modal

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "email": email,
          "address": address,
          "phoneNumber": phoneNumber,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Update User

  Future<String> updateUserProfile({
    required String email,
    required String uid,
    required String address,
    required String phoneNumber,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || address.isNotEmpty) {
        //Add User to the database with modal

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "uid": uid,
          "email": email,
          "address": address,
          "phoneNumber": phoneNumber,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Add Card
  Future<String> addCard(
      {required String cardNumber,
      required String uid,
      required String cvv,
      required String month,
      required String year}) async {
    String res = 'Some error occured';

    try {
      if (cardNumber.isNotEmpty || cvv.isNotEmpty) {
        //Add User to the database with modal

        await FirebaseFirestore.instance
            .collection('cards_details')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          "uid": uid,
          "cvv": cvv,
          "year": year,
          "cardnumber": cardNumber,
          "month": month,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Add CHat Status
  Future<String> addChatMembers(
      {required String photoURL,
      required String buyername,
      required String uuid,
      required String uid,
      String? username,
      required String buyerid}) async {
    String res = 'Some error occured';

    try {
      if (buyername.isNotEmpty) {
        String chatid = Uuid().v1();

        //Add User to the database with modal
        Chat_Model gig_model = Chat_Model(
          buyerName: buyername,
          photourl: photoURL,
          uid: uid,
          userName: username!,
          buyerid: buyerid,
          uuid: chatid,
        );
        FirebaseFirestore.instance
            .collection('chats')
            .doc("chat_messages")
            .collection("message")
            .doc(chatid)
            .set(gig_model.toJson());
        res = 'Sucessfully Uploaded in Firebase';
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
