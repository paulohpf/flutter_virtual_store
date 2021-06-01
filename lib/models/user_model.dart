import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter/material.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserCredential userCredential;
  Map<String, dynamic> userData;

  bool isLoading = false;

  void signUp({
    @required Map<String, dynamic> userData,
    @required String pass,
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'] as String, password: pass)
        .then((UserCredential user) async {
      userCredential = user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((dynamic e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    print(userData);
    this.userData = userData;
    await firestore
        .collection('users')
        .doc(userCredential.user.uid)
        .set(userData);
  }

  bool isLoggedIn() {
    return false;
  }
}
