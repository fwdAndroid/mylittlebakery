import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Chat_Model {
  String uid;
  String name;
  String buyerName;
  String buyerid;
  String uuid;

  Chat_Model({
    required this.uid,
    required this.buyerName,
    required this.name,
    required this.buyerid,
    required this.uuid,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'buyerName': buyerName,
        'uid': uid,
        'name': name,
        'buyerid': buyerid,
        'uuid': uuid,
      };

  ///
  static Chat_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return Chat_Model(
      name: snapshot['name'],
      uid: snapshot['uid'],
      buyerid: snapshot['buyerid'],
      buyerName: snapshot['buyerName'],
      uuid: snapshot['uuid'],
    );
  }
}
