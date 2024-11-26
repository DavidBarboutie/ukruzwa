import 'package:cloud_firestore/cloud_firestore.dart';

class SalleSpectacleClass {
  String? nom;
  String? adresseRue;
  String? adresseVille;
  int? nbplaceMax;
  String? structure;
  String? idSono;

  SalleSpectacleClass({
    this.nom,
    this.adresseRue,
    this.adresseVille,
    this.nbplaceMax,
    this.structure,
    this.idSono,
  });

  Future<void> create() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("SalleSpectacle").doc();
    await docVille.set({
      "nom": nom,
      "adresseRue": adresseRue,
      "adresseVille": adresseVille,
      "nbplaceMax": nbplaceMax,
      "structure": structure,
      "sono": idSono,
    });
  }

  // Future<void> read(String id) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   final docVille = db.collection("SalleSpectacle").doc(id);
  //   var getData = await docVille.get();
  //   Map<String, dynamic>? data = getData.data();
  //   nom = data?["nom"];
  //   adresseRue = data?["adresseRue"];
  //   adresseVille = data?["adresseVille"];
  //   nbplaceMax = data?["nbplaceMax"];
  //   structure = data?["structure"];
  // }

  // Future<void> update(String id) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   final docVille = db.collection("SalleSpectacle").doc(id);
  //   await docVille.set({
  //     "nom": nom,
  //     "adresseRue": adresseRue,
  //     "adresseVille": adresseVille,
  //     "nbplaceMax": nbplaceMax,
  //     "structure": structure,
  //   });
  // }

  // void delete(String id) {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   db.collection("SalleSpectacle").doc(id).delete();
  // }
}
