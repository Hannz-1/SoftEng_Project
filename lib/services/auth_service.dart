import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // REGISTER USER
  Future<User?> registerUser(String email, String password) async {

    try {

      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      await user?.sendEmailVerification();

      return user;

    } catch (e) {
      print(e);
      return null;
    }

  }

  // LOGIN USER
  Future<User?> loginUser(String email, String password) async {

    try {

      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;

    } catch (e) {
      print(e);
      return null;
    }

  }

  // LOGOUT
  Future<void> logoutUser() async {
    await _auth.signOut();
  }

}