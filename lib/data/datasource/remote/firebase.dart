import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Map<String, dynamic>>> getDocsInFirebase(String collection) async {
  //connexion a la BDD
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docname = await db.collection(collection).get();
  List<Map<String, dynamic>> docs = [];
  for (var elem in docname.docs) {
    Map<String, dynamic>? data = elem.data();
    docs.add(data);
  }
  return docs;
}

//fonction qui authentifie l'utilisateur
Future<bool> authent(String email, String pwd) async {
  bool auth = true;
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pwd);
    credential.user;
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

//fonction qui inscrit l'utilisateur
Future<bool> inscription(String email, String pwd) async {
  bool signup = false;
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pwd,
    );
    credential.user;
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
