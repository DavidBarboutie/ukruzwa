import 'package:cloud_firestore/cloud_firestore.dart';

class VilleClass {
  String? nom;

  VilleClass({
    this.nom,
  });

  Future<void> createGroup() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Ville").doc();
    await docVille.set({
      "nom": nom,
    });
  }

  Future<void> readGroup(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Ville").doc(id);
    var getData = await docVille.get();
    Map<String, dynamic>? data = getData.data();
    nom = data?["nom"];
  }

  Future<void> updateGroup(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Ville").doc(id);
    await docVille.set({
      "nom": nom,
    });
  }

  void deleteGroup(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Ville").doc(id).delete();
  }
}
