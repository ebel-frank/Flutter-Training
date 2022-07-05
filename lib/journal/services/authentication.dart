import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/journal/services/authentication_api.dart';

class AuthenticationService extends AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user!.uid;
  }

  @override
  Future<String> currentUserUid() async {
    User? user = _firebaseAuth.currentUser;
    return user!.uid;
  }

  @override
  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  @override
  Future<bool> isEmailVerified() async {
    User? user = _firebaseAuth.currentUser;
    return user!.emailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    user?.sendEmailVerification();
  }

  @override
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user!.uid;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
