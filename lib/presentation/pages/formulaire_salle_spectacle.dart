import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/salle_spectacle/salle_spectacle_bloc.dart';
import 'package:ukruzwa/presentation/bloc/salle_spectacle/salle_spectacle_state.dart';
import 'package:ukruzwa/presentation/bloc/salle_spectacle/salle_spectacle_event.dart';
import 'package:ukruzwa/presentation/pages/formulaire_sono.dart';

class SalleSpectacle extends StatefulWidget {
  const SalleSpectacle({super.key});

  @override
  State<SalleSpectacle> createState() => _SalleSpectacleState();
}

class _SalleSpectacleState extends State<SalleSpectacle> {
  TextEditingController nomSalle = TextEditingController(text: "");
  TextEditingController adresseRue = TextEditingController(text: "");
  TextEditingController adresseVille = TextEditingController(text: "");
  TextEditingController nbPlacesMax = TextEditingController(text: "0");
  TextEditingController structure = TextEditingController(text: "");
  bool? sonoBool = false;
  bool? privee = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalleSpectacleBloc(),
      child: BlocBuilder<SalleSpectacleBloc, SalleSpectacleState>(
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
                          "Formulaire d'ajout de salle de spectacle",
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
                                  "Nom de la salle",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: TextFormField(controller: nomSalle),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "rue",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: adresseRue),
                          ),
                          const Text(
                            "Ville",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: adresseVille),
                          ),

                          //filtrer les chiffres pour le prix
                          TextFormField(
                              controller: nbPlacesMax,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  labelText:
                                      "nombre de places maximum de la salle",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))),

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
                          //choix de la structure
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "privée",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Checkbox(
                                    value: privee,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        privee = value;
                                      });
                                    },
                                  )),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String struct;
                              if (privee == true) {
                                struct = "privée";
                              } else {
                                struct = "publique";
                              }

                              //si sono est cocher rediriger vers le formulaire de sono, sinon finaliser l'inscription
                              bool sono = false;
                              if (sonoBool == null) {
                                sono = false;
                              } else {
                                sono = sonoBool!;
                              }
                              //envoie des données a la bdd
                              BlocProvider.of<SalleSpectacleBloc>(context).add(
                                AddDataSalleSpectacleEvent(
                                  nomSalle.text,
                                  adresseRue.text,
                                  adresseVille.text,
                                  int.parse(nbPlacesMax.text),
                                  // structure.text,
                                  struct,
                                  sono,
                                ),
                              );
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
