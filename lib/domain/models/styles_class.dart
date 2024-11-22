import 'package:cloud_firestore/cloud_firestore.dart';

class StylesClass {
  String? nom;

  StylesClass({
    this.nom,
  });

  Future<void> createStyles() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Styles").doc();
    await docVille.set({
      "nom": nom,
    });
  }

  Future<void> readStyles(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Styles").doc(id);
    var getData = await docVille.get();
    Map<String, dynamic>? data = getData.data();
    nom = data?["nom"];
  }

  Future<void> updateStyles(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Styles").doc(id);
    await docVille.set({
      "nom": nom,
    });
  }

  void deleteStyles(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Styles").doc(id).delete();
  }
}
