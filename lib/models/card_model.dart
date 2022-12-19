import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Card_Model {
  String uid;
  String cardnumber;
  String year;
  String cvv;
  String month;

  Card_Model({
    required this.uid,
    required this.cardnumber,
    required this.cvv,
    required this.year,
    required this.month,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'cardnumber': cardnumber,
        'uid': uid,
        'cvv': cvv,
        'year': year,
        'month': month,
      };

  ///
  static Card_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return Card_Model(
      cardnumber: snapshot['cardnumber'],
      uid: snapshot['uid'],
      cvv: snapshot['cvv'],
      year: snapshot['year'],
      month: snapshot['month'],
    );
  }
}
