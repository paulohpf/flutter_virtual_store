import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter/material.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserCredential userCredential;
  Map<String, dynamic> userData = <String, dynamic>{};

  bool isLoading = false;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

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

  Future<void> signIn({
    @required String email,
    @required String pass,
    @required VoidCallback onSuccess,
    @required VoidCallback onFail,
  }) async {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((UserCredential user) async {
      userCredential = user;

      await _loadCurrentUser();

      onSuccess();

      isLoading = false;
      notifyListeners();
    }).catchError((dynamic e) {
      onFail();

      isLoading = false;
      notifyListeners();
    });
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

  Future<void> _loadCurrentUser() async {
    print(userCredential);
    userCredential ??= _auth.currentUser as UserCredential;

    if (userCredential != null) {
      if (userData['name'] == null) {
        await firestore
            .collection('users')
            .doc(userCredential.user.uid)
            .get()
            .then((DocumentSnapshot docUser) {
          userData = docUser.data();
        });
      }
    }

    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();

    userData = <String, dynamic>{};
    userCredential = null;

    notifyListeners();
  }

  bool isLoggedIn() {
    return userCredential != null;
  }
}
