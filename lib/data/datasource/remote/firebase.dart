import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ukruzwa/domain/models/candidat_class.dart';
import 'package:ukruzwa/domain/models/contact_class.dart';
import 'package:ukruzwa/domain/models/group_class.dart';
import 'package:ukruzwa/domain/models/sono_class.dart';

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
  String? styles,
  String? adresseRepet,
  int? nbChanteurs,
  int? prixMin,
  String? endroitJouee,
) async {
  final groupTemp = GroupClass(nomGroupe, setList, styles, adresseRepet,
      nbChanteurs, prixMin, endroitJouee);

  FirebaseFirestore db = FirebaseFirestore.instance;
  final docVille = db.collection("Groupe").doc();
  await docVille.set({
    "nomGroupe": groupTemp.nomGroupe,
    "setList": groupTemp.setList,
    "styles": groupTemp.styles,
    "adresseRepet": groupTemp.adresseRepet,
    "nbChanteurs": groupTemp.nbChanteurs,
    "prixMin": groupTemp.prixMin,
    "endroitJouee": groupTemp.endroitJouee,
  });
}

//ajout du candidat dans la BDD
Future<void> createCandidat(
  String? numTel,
  String? numTelBackup,
) async {
  final groupTemp = CandidatClass(numTel, numTelBackup);
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docVille = db.collection("Candidat").doc();
  await docVille.set({
    "numTel": groupTemp.numTel,
    "numTelBackup": groupTemp.numTelBackup,
  });
}

//ajout du candidat dans la BDD
Future<void> createContact(
  String? nom,
  String? prenom,
  String? adresseContact,
) async {
  final groupTemp = ContactClass(nom, prenom, adresseContact);
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docVille = db.collection("Contact").doc();
  await docVille.set({
    "nom": groupTemp.nom,
    "prenom": groupTemp.prenom,
    "adresseContact": groupTemp.adresseContact,
  });
}

//ajout de la sono dans la BDD
Future<void> createSono(
  bool? ingeSon,
  bool? professionnel,
  String? modeleSono,
  String? puissanceSono,
  int? prixLocSono,
  int? prixLocInge,
) async {
  final groupTemp = SonoClass(ingeSon, professionnel, modeleSono, puissanceSono,
      prixLocSono, prixLocInge);
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docVille = db.collection("Sonorosation").doc();
  await docVille.set({
    "ingeSon": groupTemp.ingeSon,
    "professionnel": groupTemp.professionnel,
    "modeleSono": groupTemp.modeleSono,
    "puissanceSono": groupTemp.puissanceSono,
    "prixLocSono": groupTemp.prixLocSono,
    "prixLocInge": groupTemp.prixLocInge,
  });
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
