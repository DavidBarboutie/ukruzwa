import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_bloc.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _inscriptionState();
}

// ignore: camel_case_types
class _inscriptionState extends State<Inscription> {
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
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //titre
                    const Center(child: Text("Formulaire d'inscription")),
                    //formulaire
                    Row(
                      children: [
                        const Text("Nom du groupe : "),
                        TextFormField(controller: nomGroupe),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text("style_groupe : "),
                            TextFormField(
                              controller: styleGroupe,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text("set_list : "),
                            TextFormField(
                              controller: setList,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text("nom : "),
                                TextFormField(
                                  controller: nom,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text("prenom : "),
                                TextFormField(controller: prenom)
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("num_tel : "),
                                    TextFormField(
                                      controller: numTel,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("num tel de remplacement : "),
                                    TextFormField(
                                      controller: numTelRemplacement,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("adresse_contact : "),
                                        TextFormField(
                                          controller: adresseContact,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("adresse_repet_groupe : "),
                                        TextFormField(
                                          controller: adresseRepetGroupe,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(children: [
                                          const Text("instruments_jouees : "),
                                          TextFormField(
                                            controller: instrumentsJouees,
                                          )
                                        ]),
                                        Row(
                                          children: [
                                            const Text("chanteur : "),
                                            TextFormField(
                                              controller: chanteur,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                    "prix minimum du groupe"),
                                                TextFormField(
                                                  controller: prixMinimumGrp,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                    "endroit ou le groupe a jouer"),
                                                TextFormField(
                                                  controller: endroitGrpAJouer,
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                        "possède une sono : "),
                                                    Checkbox(
                                                      value: sonoBool,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          sonoBool = value;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  //envoie des données a la bdd
                                                  BlocProvider.of<
                                                              InscriptionBloc>(
                                                          context)
                                                      .add(RetourEvent());
                                                  //si sono est cocher rediriger vers le formulaire de sono, sinon finaliser l'inscription
                                                  //sono_bool ? redirect(page_sono) : afficher "inscription finaliser"
                                                },
                                                child: const Text(
                                                    "soummettre le formulaire"))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
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
