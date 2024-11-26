import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_bloc.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_state.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_event.dart';

class Sono extends StatefulWidget {
  const Sono({super.key});

  @override
  State<Sono> createState() => _SonoState();
}

class _SonoState extends State<Sono> {
  bool? ingeSonBool = false;
  bool? proBool = false;
  TextEditingController modeleSono = TextEditingController(text: "");
  TextEditingController puissanceSono = TextEditingController(text: "");
  TextEditingController prixLocSono = TextEditingController(text: "0");
  TextEditingController prixLocInge = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SonoBloc(),
      child: BlocBuilder<SonoBloc, SonoState>(
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
                          "Formulaire sonorisation",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "ingénieur son : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Checkbox(
                                          value: ingeSonBool,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              ingeSonBool = value;
                                            });
                                          },
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "ingénieur professionnel : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Checkbox(
                                    value: proBool,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        proBool = value;
                                      });
                                    },
                                  )),
                            ],
                          ),
                          const Text(
                            "modele de la sonorisation : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: modeleSono),
                          ),
                          const Text(
                            "puissance de la sonorisation : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(controller: puissanceSono),
                          ),
                          TextFormField(
                              controller: prixLocSono,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  labelText:
                                      "prix de la location de la sonorisation",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))),
                          TextFormField(
                              controller: prixLocInge,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                  labelText:
                                      "prix de la location de l'ingenieur",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ))),
                          ElevatedButton(
                            onPressed: () {
                              //envoie des données a la bdd
                              BlocProvider.of<SonoBloc>(context)
                                  .add(AddDataSonoEvent(
                                ingeSonBool,
                                proBool,
                                modeleSono.text,
                                puissanceSono.text,
                                int.parse(prixLocSono.text),
                                int.parse(prixLocInge.text),
                              ));
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
                              height: MediaQuery.sizeOf(context).height * 0.05)
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
