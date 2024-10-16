import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getDataInFirebase() async {
  //connexion a la BDD
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docname = db.collection("bts").doc("test");
  var getdata = await docname.get();

  Map<String, dynamic>? data = getdata.data();
  String name = data!["name"];

  return name;
}

Future<bool> setDataInFirebase(String name) async {
  try {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docname = db.collection("bts").doc("test");
    await docname.set({"name": name});
    return true;
  } catch (error) {
    return false;
  }
}
