import 'package:cloud_firestore/cloud_firestore.dart';

class CandidatClass {
  String? numTel;
  String? numTelBackup;

  CandidatClass({
    this.numTel,
    this.numTelBackup,
  });

  Future<void> createCandidat() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Candidat").doc();
    await docVille.set({
      "numTel": numTel,
      "numTelBackup": numTelBackup,
    });
  }

  Future<void> readCandidat(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Candidat").doc(id);
    var getData = await docVille.get();
    Map<String, dynamic>? data = getData.data();
    numTel = data?["numTel"];
    numTelBackup = data?["numTelBackup"];
  }

  Future<void> updateGroup(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Candidat").doc(id);
    await docVille.set({
      "numTel": numTel,
      "numTelBackup": numTelBackup,
    });
  }

  void deleteGroup(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Candidat").doc(id).delete();
  }
}
