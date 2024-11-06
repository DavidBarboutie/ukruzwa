import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/home_bloc.dart';
import 'package:ukruzwa/presentation/bloc/home_event.dart';
import 'package:ukruzwa/presentation/bloc/home_state.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<Inscription> {
  TextEditingController nom_groupe = TextEditingController(text: "");
  TextEditingController style_groupe = TextEditingController(text: "");
  TextEditingController set_list = TextEditingController(text: "");
  TextEditingController nom = TextEditingController(text: "");
  TextEditingController prenom = TextEditingController(text: "");
  TextEditingController num_tel = TextEditingController(text: "");
  TextEditingController num_tel_remplacement = TextEditingController(text: "");
  TextEditingController adresse_contact = TextEditingController(text: "");
  TextEditingController adresse_repet_groupe = TextEditingController(text: "");
  TextEditingController instruments_jouees = TextEditingController(text: "");
  TextEditingController chanteur = TextEditingController(text: "");
  TextEditingController prix_minimum_grp = TextEditingController(text: "");
  TextEditingController endroit_grp_a_jouer = TextEditingController(text: "");
  bool? sono_bool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
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
                        TextFormField(controller: nom_groupe),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text("style_groupe : "),
                            TextFormField(
                              controller: style_groupe,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text("set_list : "),
                            TextFormField(
                              controller: set_list,
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
                                      controller: num_tel,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("num tel de remplacement : "),
                                    TextFormField(
                                      controller: num_tel_remplacement,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("adresse_contact : "),
                                        TextFormField(
                                          controller: adresse_contact,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("adresse_repet_groupe : "),
                                        TextFormField(
                                          controller: adresse_repet_groupe,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(children: [
                                          const Text("instruments_jouees : "),
                                          TextFormField(
                                            controller: instruments_jouees,
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
                                                  controller: prix_minimum_grp,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                    "endroit ou le groupe a jouer"),
                                                TextFormField(
                                                  controller:
                                                      endroit_grp_a_jouer,
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
                                                      value: sono_bool,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          sono_bool = value;
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
                                                  BlocProvider.of<HomeBloc>(
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
            );
          },
        ),
      ),
    );
  }
}
