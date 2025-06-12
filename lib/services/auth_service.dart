

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String? get username => _auth.currentUser?.email;

  static Future<User?> signup(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;

    } on FirebaseAuthException catch (e) {
      print('Failed to sign up: $e');
      throw e;
    }
  }

  static Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch(e) {
      print('Failed to login');
      throw e;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}