import 'package:cloud_firestore/cloud_firestore.dart';

class ContactClass {
  String? nom;
  String? prenom;
  String? adresseContact;

  ContactClass({
    this.nom,
    this.prenom,
    this.adresseContact,
  });

  //ajout du candidat dans la BDD
  Future<void> createContact() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Contact").doc();
    await docVille.set({
      "nom": nom,
      "prenom": prenom,
      "adresseContact": adresseContact,
    });
  }

  Future<void> readContact(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Contact").doc(id);
    var getData = await docVille.get();
    Map<String, dynamic>? data = getData.data();
    nom = data?["nom"];
    prenom = data?["prenom"];
    adresseContact = data?["adresseContact"];
  }

  Future<void> updateContact(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Contact").doc(id);
    await docVille.set({
      "nom": nom,
      "prenom": prenom,
      "adresseContact": adresseContact,
    });
  }

  void deleteContact(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Contact").doc(id).delete();
  }
}
