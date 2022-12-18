import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Orders_Model {
  String uid;
  String itemName;
  String price;
  String moneyType;
  String description;
  String photoURL;
  String status;
  String doctorId;
  final datePublished;

  Orders_Model(
      {required this.uid,
      required this.itemName,
      required this.price,
      required this.doctorId,
      required this.photoURL,
      required this.status,
      required this.description,
      required this.datePublished,
      required this.moneyType});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'uid': uid,
        'price': price,
        'description': description,
        'photoURL': photoURL,
        "moneyType": moneyType,
        'doctorId': doctorId,
        'status': status,
        'datePublished':datePublished
      };

  ///
  static Orders_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return Orders_Model(
        status: snapshot['status'],
        itemName: snapshot['itemName'],
        uid: snapshot['uid'],
        photoURL: snapshot['photoURL'],
        price: snapshot['price'],
        description: snapshot['description'],
        moneyType: snapshot['moneyType'],
        datePublished: snapshot['datePublished'],
        doctorId: snapshot['doctorId']);
  }
}
