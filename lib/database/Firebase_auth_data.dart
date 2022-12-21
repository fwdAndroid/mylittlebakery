import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylittlebakery/database/firebase_storage.dart';
import 'package:mylittlebakery/models/users_models.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//Get Users Details
  
  //Register User
  Future<String> userSignUp(
      {required String email,
      required String pass,
      required String address,
      required String phoneNumber,
      required String gender,
      required String name,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty || gender.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        String photoURL = await StorageMethods()
            .uploadImageToStorage('UsersPics', file, false);
        //Add User to the database with modal
        User_Model userModel = User_Model(
            phoneNumber: phoneNumber,
            name: name,
            address: address,
            gender: gender,
            uid: cred.user!.uid,
            email: email,
            type: "Seller",
            photoURL: photoURL);
        await firebaseFirestore
            .collection('Users')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Register  with buyer User
  Future<String> signUpUser(
      {required String email,
      required String pass,
      required String address,
      required String phoneNumber,
      required String username,
      required String name,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty || username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal
        User_Model userModel = User_Model(
            phoneNumber: phoneNumber,
            name: name,
            address: address,
            buyerUserName: username,
            uid: cred.user!.uid,
            email: email,
            type: "Seller",
            photoURL: photoURL);
        await firebaseFirestore
            .collection('Users')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  ///Login Buyer
  Future<String> loginUpUser({
    required String email,
    required String pass,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);

        res = 'sucess';
      }
    } on FirebaseException catch (e) {
      if (e == 'WrongEmail') {
        print(e.message);
      }
      if (e == 'WrongPassword') {
        print(e.message);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Users SignIN
  Future<String> userLogin({
    required String email,
    required String pass,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);

        res = 'sucess';
      }
    } on FirebaseException catch (e) {
      if (e == 'WrongEmail') {
        print(e.message);
      }
      if (e == 'WrongPassword') {
        print(e.message);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
