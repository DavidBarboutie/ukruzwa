import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_bloc.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';
import 'package:ukruzwa/presentation/pages/formulaire_sono.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController nomGroupe = TextEditingController(text: "");
  TextEditingController styleGroupe = TextEditingController(text: "");
  TextEditingController setList = TextEditingController(text: "");
  TextEditingController nom = TextEditingController(text: "");
  TextEditingController prenom = TextEditingController(text: "");
  TextEditingController numTel = TextEditingController(text: "");
  TextEditingController numTelRemplacement = TextEditingController(text: "");
  TextEditingController adresseContact = TextEditingController(text: "");
  TextEditingController adresseRepetGroupe = TextEditingController(text: "");
  TextEditingController instrumentsJouees = TextEditingController(text: "");
  TextEditingController chanteur = TextEditingController(text: "");
  TextEditingController prixMinimumGrp = TextEditingController(text: "0");
  TextEditingController endroitGrpAJouer = TextEditingController(text: "");
  bool? sonoBool = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InscriptionBloc(),
      child: BlocBuilder<InscriptionBloc, InscriptionState>(
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.07),
                      const Center(
                        child: Text(
                          "Formulaire d'inscription",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.07),
                      //formulaire
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                const Text(
                                  "Nom du groupe : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: TextFormField(controller: nomGroupe),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "style groupe : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: styleGroupe),
                          ),
                          const Text(
                            "set list : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: setList),
                          ),
                          const Text(
                            "nom : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: nom),
                          ),
                          const Text(
                            "prenom : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: prenom),
                          ),
                          const Text(
                            "num tel : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: numTel),
                          ),
                          const Text(
                            "num tel de remplacement : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child:
                                TextFormField(controller: numTelRemplacement),
                          ),
                          const Text(
                            "adresse contact : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: adresseContact),
                          ),
                          const Text(
                            "adresse repet groupe : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child:
                                TextFormField(controller: adresseRepetGroupe),
                          ),
                          const Text(
                            "instruments jouees : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: instrumentsJouees),
                          ),
                          const Text(
                            "chanteur : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: chanteur),
                          ),
                          //filtrer les chiffres pour le prix
                          TextFormField(
                              controller: prixMinimumGrp,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  labelText: "prix minimum du groupe : ",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))),
                          const Text(
                            "endroit(s) où le groupe a jouer : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: endroitGrpAJouer),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "possède une sono : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Checkbox(
                                    value: sonoBool,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        sonoBool = value;
                                      });
                                    },
                                  )),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //compte le nb de chanteurs
                              String chanteurs = chanteur.text;
                              List<String> singers = chanteurs.split(" ");

                              //envoie des données a la bdd
                              BlocProvider.of<InscriptionBloc>(context).add(
                                AddDataInscriptionEvent(
                                  nomGroupe.text,
                                  styleGroupe.text,
                                  setList.text,
                                  nom.text,
                                  prenom.text,
                                  numTel.text,
                                  numTelRemplacement.text,
                                  adresseContact.text,
                                  adresseRepetGroupe.text,
                                  instrumentsJouees.text,
                                  singers.length,
                                  int.parse(prixMinimumGrp.text),
                                  endroitGrpAJouer.text,
                                  sonoBool,
                                ),
                              );
                              //si sono est cocher rediriger vers le formulaire de sono, sinon finaliser l'inscription
                              bool sono = false;
                              if (sonoBool == null) {
                                sono = false;
                              } else {
                                sono = sonoBool!;
                              }
                              sono
                                  ? WidgetsBinding.instance
                                      .addPostFrameCallback(
                                      (_) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Sono(),
                                          ),
                                        );
                                      },
                                    )
                                  : showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("inscription"),
                                          content: const Text(
                                              "inscription finalisée"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("OK"),
                                            )
                                          ],
                                        );
                                      },
                                    );
                            },
                            child: const Text(
                              "soummettre le formulaire",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.05),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
