import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Chat_Model {
  String uid;
  String photourl;
  String buyerName;
  String buyerid;
  String uuid;
  String userName;

  Chat_Model({
    required this.uid,
    required this.buyerName,
    required this.photourl,
    required this.buyerid,
    required this.uuid,
    required this.userName,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'buyerName': buyerName,
        'uid': uid,
        'userName':userName,
        'photourl': photourl,
        'buyerid': buyerid,
        'uuid': uuid,
      };

  ///
  static Chat_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return Chat_Model(
      photourl: snapshot['photourl'],
      uid: snapshot['uid'],
      buyerid: snapshot['buyerid'],
      buyerName: snapshot['buyerName'],
      uuid: snapshot['uuid'],
      userName: snapshot['userName']
    );
  }
}
