import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // REGISTER
  Future<User?> registerUser(
      String username,
      String email,
      String password) async {

    try {

      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      await user?.sendEmailVerification();

      // Save user to Firestore
      await _firestore.collection("users").doc(user!.uid).set({
        "username": username,
        "email": email,
        "createdAt": Timestamp.now(),
      });

      return user;

    } catch (e) {
      print(e);
      return null;
    }

  }

  // LOGIN
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