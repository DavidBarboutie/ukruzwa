import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ukruzwa/domain/models/ville_class.dart';

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

Future<void> createGroup(
    String? nomGroupe,
    String? setList,
    String? adresseRepet,
    int? nbChanteurs,
    int? prixMin,
    String? endroitJouee,
    String? ingeSon,
    String? professionnel,
    String? puissanceSono,
    String? locationSono,
    String? locationInge) async {
  // On ajoute la ville et l'utilisateur en base

  final groupTemp = GroupClass(
      nomGroupe,
      setList,
      adresseRepet,
      nbChanteurs,
      prixMin,
      endroitJouee,
      ingeSon,
      professionnel,
      puissanceSono,
      locationSono,
      locationInge);

  FirebaseFirestore db = FirebaseFirestore.instance;
  final docVille = db.collection("Groupe").doc(().toString());
  await docVille.set({
    "nomGroupe": groupTemp.nomGroupe,
    "setList": groupTemp.setList,
    "adresseRepet": groupTemp.adresseRepet,
    "nbChanteurs": groupTemp.nbChanteurs,
    "prixMin": groupTemp.prixMin,
    "endroitJouee": groupTemp.endroitJouee,
    "ingeSon": groupTemp.ingeSon,
    "professionnel": groupTemp.professionnel,
    "puissanceSono": groupTemp.puissanceSono,
    "locationSono": groupTemp.locationSono,
    "locationInge": groupTemp.locationInge,
  });
}

// Future<bool> setNomGrp(String? nomGrp) async {
//   try {
//     final docname = setdata();
//     await docname.set({"nom de groupe": nomGrp});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setStyleGrp(String? styleGrp) async {
//   try {
//     final docname = setdata();
//     await docname.set({"style du groupe": styleGrp});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setSetList(String? setList) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"setList": setList});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setNom(String? nom) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"nom": nom});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setPrenom(String? prenom) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"prenom": prenom});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setNumTel(String? numTel) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"numTel": numTel});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setNumTelRemplacement(String? numTelRemplacement) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"numTelRemplacement": numTelRemplacement});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setAdresseContact(String? adresseContact) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"adresseContact": adresseContact});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setAdresseRepet(String? adresseRepet) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"adresseRepet": adresseRepet});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setsInstrumentsJouees(String? instrumentsJouees) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"instrumentsJouees": instrumentsJouees});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setChanteur(String? chanteur) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"chanteur": chanteur});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setsPrixMinGrp(int? prixMinGrp) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"prixMinGrp": prixMinGrp});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setEndroitGrpAjouer(String? endroitGrpAjouer) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"endroitGrpAjouer": endroitGrpAjouer});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

// Future<bool> setSono(bool? sono) async {
//   try {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final docname = db.collection("inscription").doc();
//     await docname.set({"sono": sono});
//     return true;
//   } catch (error) {
//     return false;
//   }
// }

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
