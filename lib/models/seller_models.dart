import 'package:cloud_firestore/cloud_firestore.dart';

class SellerModel {
  String uid;
  String email;
  String name;
  String username;
  String address;
  String phoneNumber;
  String photoURL;
  String type;

  SellerModel(
      {required this.uid,
      required this.email,
      required this.username,
      required this.photoURL,
      required this.phoneNumber,
      required this.name,
      required this.type,
      required this.address});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'name': name,
        'address': address,
        'photoURL': photoURL,
        'type':type
      };

  ///
  static SellerModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return SellerModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoURL: snapshot['photoURL'],
      name: snapshot['name'],
      address: snapshot['address'],
      phoneNumber: snapshot['phoneNumber'],
      type:snapshot['type']
    );
  }
}
