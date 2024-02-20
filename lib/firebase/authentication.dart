import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth{

  static Future<UserCredential> logIn({
    required String email, required String password
  })async{

   return FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email, password: password);
  }

  static Future<void>  signUp({
    required String fullname,
    required String email,
    required String password,
    required String contact
  })async{
    final donarsCollection = FirebaseFirestore.instance.collection("donar_user");

    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password);

    await donarsCollection.doc(user.user?.uid).set({
      "fullname": fullname,
      "email": email,
      "contact": contact
    });
  }
}