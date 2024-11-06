// ignore_for_file: avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Future<String> getDataInFirebase() async {
//   //connexion a la BDD
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   final docname = db.collection("test").doc("XIwvP47zHq3g68QnNPWo");
//   var getdata = await docname.get();

//   Map<String, dynamic>? data = getdata.data();
//   String name = data!["name"];

//   return name;
// }

// Future<bool> setDataInFirebase(String name) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("test").doc("XIwvP47zHq3g68QnNPWo");
//     await docname.set({"name": name});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

Future<bool> authent(String email, String pwd) async {
  bool auth = true;
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pwd);
  } on FirebaseAuthException catch (e) {
    auth = false;
    if (e.code == 'user-not-found') {
      ('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }

  return auth;
}

Future<bool> inscription(String email, String pwd) async {
  bool signup = false;
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pwd,
    );
    signup = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return signup;
}
