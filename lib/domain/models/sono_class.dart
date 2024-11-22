import 'package:cloud_firestore/cloud_firestore.dart';

class SonoClass {
  bool? ingeSon;
  bool? professionnel;
  String? modeleSono;
  String? puissanceSono;
  int? prixLocSono;
  int? prixLocInge;

  SonoClass({
    this.ingeSon,
    this.professionnel,
    this.modeleSono,
    this.puissanceSono,
    this.prixLocSono,
    this.prixLocInge,
  });

  Future<void> createSono() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Sono").doc();
    await docVille.set({
      "ingeSon": ingeSon,
      "professionnel": professionnel,
      "modeleSono": modeleSono,
      "puissanceSono": puissanceSono,
      "prixLocSono": prixLocSono,
      "prixLocInge": prixLocInge,
    });
  }

  Future<void> readSono(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Sono").doc(id);
    var getData = await docVille.get();
    Map<String, dynamic>? data = getData.data();
    ingeSon = data?["ingeSon"];
    professionnel = data?["professionnel"];
    modeleSono = data?["modeleSono"];
    puissanceSono = data?["puissanceSono"];
    prixLocSono = data?["prixLocSono"];
    prixLocInge = data?["prixLocInge"];
  }

  Future<void> updateSono(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Sono").doc(id);
    await docVille.set({
      "ingeSon": ingeSon,
      "professionnel": professionnel,
      "modeleSono": modeleSono,
      "puissanceSono": puissanceSono,
      "prixLocSono": prixLocSono,
      "prixLocInge": prixLocInge,
    });
  }

  void deleteSono(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Sono").doc(id).delete();
  }
}
