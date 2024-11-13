import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_bloc.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';

import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';

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
  TextEditingController prixMinimumGrp = TextEditingController(text: "");
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
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                    const Center(
                      child: Text("Formulaire d'inscription"),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                    //formulaire
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Nom du groupe : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: nomGroupe),
                        ),
                        const Text("style_groupe : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: styleGroupe),
                        ),
                        const Text("set_list : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: setList),
                        ),
                        const Text("nom : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: nom),
                        ),
                        const Text("prenom : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: prenom),
                        ),
                        const Text("num_tel : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: numTel),
                        ),
                        const Text("num tel de remplacement : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: numTelRemplacement),
                        ),
                        const Text("adresse_contact : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: adresseContact),
                        ),
                        const Text("adresse_repet_groupe : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: adresseRepetGroupe),
                        ),
                        const Text("instruments_jouees : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: instrumentsJouees),
                        ),
                        const Text("chanteur : "),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: chanteur),
                        ),
                        const Text("prix minimum du groupe"),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: prixMinimumGrp),
                        ),
                        const Text("endroit ou le groupe a jouer"),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFormField(controller: endroitGrpAJouer),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("possède une sono : "),
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
                              //envoie des données a la bdd
                              BlocProvider.of<InscriptionBloc>(context)
                                  .add(RetourEvent());
                              //si sono est cocher rediriger vers le formulaire de sono, sinon finaliser l'inscription
                              //sono_bool ? redirect(page_sono) : afficher "inscription finaliser"
                            },
                            child: const Text("soummettre le formulaire"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
