import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/home_bloc.dart';
import 'package:ukruzwa/presentation/bloc/home_event.dart';
import 'package:ukruzwa/presentation/bloc/home_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  TextEditingController tec_email = TextEditingController(text: "");
  TextEditingController tec_pwd = TextEditingController(text: "");
  bool datasend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(const HomeEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            if (state is HomeStateInitial) {
              //page d'authentification
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //section email
                  Column(children: [
                    Text("email"),
                    TextFormField(
                      controller: tec_email,
                    )
                  ]),
                  //section password
                  Column(
                    children: [
                      Text("pwd"),
                      TextFormField(
                        controller: tec_pwd,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      //bouton inscritpion
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(AuthEvent(tec_email.text, tec_pwd.text));
                          datasend = true;
                        },
                        child: const Text("s'authentifier"),
                      ),

                      //bouton authentification
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(AuthEvent(tec_email.text, tec_pwd.text));
                          datasend = true;
                        },
                        child: const Text("s'authentifier"),
                      )
                    ],
                  )
                ],
              );
            } else if (state is AuthState) {
              return const Center(child: Text("authentification réussi"));
            } else {
              return const Center(
                  child: Text("Erreur lors de l'authentification"));
            }
          },
        ),
      ),
    );
  }
}
