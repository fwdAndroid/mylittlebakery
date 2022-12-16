import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model {
  String uid;
  String email;
  String name;
  String gender;
  String address;
  String phoneNumber;
  String photoURL;
  String type;

  User_Model(
      {required this.uid,
      required this.email,
      required this.gender,
      required this.photoURL,
      required this.phoneNumber,
      required this.name,
      required this.type,
      required this.address});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'gender': gender,
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'name': name,
        'address': address,
        'photoURL': photoURL,
        'type':type
      };

  ///
  static User_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return User_Model(
      gender: snapshot['gender'],
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
