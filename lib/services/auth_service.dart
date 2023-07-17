// ignore_for_file: unused_local_variable, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example_one/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  //Bir adet firestore objesine ihtiyacımız var
  final userCollection = FirebaseFirestore.instance.collection('users');

  final firebaseAuth = FirebaseAuth.instance;
  Future<void> signUp(BuildContext context,
      {required String name,
      required String mail,
      required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: mail, password: password);
      if (userCredential.user != null) {
        Fluttertoast.showToast(
            msg: 'Giriş Başarılı', toastLength: Toast.LENGTH_LONG);
        _registerUser(name: name, mail: mail, password: password);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SecondPage()));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signIn(BuildContext context,
      {required String name,
      required String mail,
      required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: mail, password: password);
      if (userCredential.user != null) {
        //Page route
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SecondPage()));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  //fonk oluşturalım.
  Future<void> _registerUser(
      {required String name,
      required String mail,
      required String password}) async {
    await userCollection
        .doc()
        .set({'mail': mail, 'name': name, 'password': password});
  }
}
