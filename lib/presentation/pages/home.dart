// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/home_bloc.dart';
import 'package:ukruzwa/presentation/bloc/home_event.dart';
import 'package:ukruzwa/presentation/bloc/home_state.dart';
import 'package:ukruzwa/presentation/pages/formulaire_inscription.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<Home> {
  TextEditingController tec_email = TextEditingController(text: "");
  TextEditingController tec_pwd = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            if (state is HomeStateInitial || state is InscriptionState) {
              //page d'authentification
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //section email
                  Column(children: [
                    const Text("email"),
                    TextFormField(
                      controller: tec_email,
                    )
                  ]),
                  //section password
                  Column(
                    children: [
                      const Text("pwd"),
                      TextFormField(
                        obscureText: true,
                        controller: tec_pwd,
                      )
                    ],
                  ),

                  state is HomeStateInitial
                      ? Row(children: [
                          //bouton inscritpion
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context).add(
                                  InscriptionEvent(
                                      tec_email.text, tec_pwd.text));
                              tec_email.text = "";
                              tec_pwd.text = "";
                            },
                            child: const Text("s'inscrire"),
                          ),
                          //bouton authentification
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(AuthEvent(tec_email.text, tec_pwd.text));
                              tec_email.text = "";
                              tec_pwd.text = "";
                            },
                            child: const Text("s'authentifier"),
                          )
                        ])
                      :

                      //bouton authentification
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<HomeBloc>(context)
                                .add(AuthEvent(tec_email.text, tec_pwd.text));
                          },
                          child: const Text("s'authentifier"),
                        )
                ],
              );
            } else if (state is AuthState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Inscription()),
                );
              });
            } else {
              return AlertDialog(
                title: const Text("Authentification ratée"),
                content: const Text("veuillez réessayer"),
                actions: [
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(RetourEvent());
                      },
                      child: const Text("OK"))
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
