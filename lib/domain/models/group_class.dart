import 'package:cloud_firestore/cloud_firestore.dart';

class GroupClass {
  String? nomGroupe;
  String? setList;
  String? styles;
  String? adresseRepet;
  int? nbChanteurs;
  int? prixMin;
  String? endroitJouee;

  GroupClass({
    this.nomGroupe,
    this.setList,
    this.styles,
    this.adresseRepet,
    this.nbChanteurs,
    this.prixMin,
    this.endroitJouee,
  });

  //cree un nouveau group
  Future<void> createGroup() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Groupe").doc();
    await docVille.set({
      "nomGroupe": nomGroupe,
      "setList": setList,
      "styles": styles,
      "adresseRepet": adresseRepet,
      "nbChanteurs": nbChanteurs,
      "prixMin": prixMin,
      "endroitJouee": endroitJouee,
    });
  }

  Future<void> readGroup(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Groupe").doc(id);
    var getData = await docVille.get();
    Map<String, dynamic>? data = getData.data();
    nomGroupe = data?["nomGroupe"];
    setList = data?["setList"];
    styles = data?["styles"];
    adresseRepet = data?["adresseRepet"];
    nbChanteurs = data?["nbChanteurs"];
    prixMin = data?["prixMin"];
    endroitJouee = data?["endroitJouee"];
  }

  Future<void> updateGroup(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docVille = db.collection("Groupe").doc(id);
    await docVille.set({
      "nomGroupe": nomGroupe,
      "setList": setList,
      "styles": styles,
      "adresseRepet": adresseRepet,
      "nbChanteurs": nbChanteurs,
      "prixMin": prixMin,
      "endroitJouee": endroitJouee,
    });
  }

  void deleteGroup(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("Groupe").doc(id).delete();
  }
}
