import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Gig_Model {
  String uid;
  String itemName;
  String categoryName;
  String price;
  String description;
  List<File> multiImages;
  String photoURL;
  final likes;
  String uuid;
  String name;
  Gig_Model(
      {
        required this.name,
        required this.uid,
      required this.itemName,
      required this.categoryName,
      required this.price,
      required this.photoURL,
      required this.description,
      required this.multiImages,
      required this.uuid,
      required this.likes});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'uid': uid,
        'categoryName': categoryName,
        'price': price,
        'description': description,
        'multiImages': multiImages,
        'photoURL': photoURL,
        'uuid': uuid,
        'likes': likes,
        'name':name
      };

  ///
  static Gig_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return Gig_Model(
      name: snapshot['name'],
      itemName: snapshot['itemName'],
      uid: snapshot['uid'],
      categoryName: snapshot['categoryName'],
      photoURL: snapshot['photoURL'],
      price: snapshot['price'],
      uuid: snapshot['uuid'],
      likes: snapshot['likes'],
      description: snapshot['description'],
      multiImages: snapshot['multiImages'],
    );
  }
}
