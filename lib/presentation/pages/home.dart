import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/bloc/Home_bloc.dart';
import 'package:ukruzwa/presentation/bloc/Home_event.dart';
import 'package:ukruzwa/presentation/bloc/Home_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  TextEditingController tec = TextEditingController(text: "Nom");
  bool datasend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(const HomeEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            if (state is HomeStateInitial) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.name),
                  TextFormField(
                    controller: tec,
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(AddDataEvent(tec.text));
                      datasend = true;
                    },
                    child: const Text("add name"),
                  ),
                ],
              );
            } else if (state is AddDataState) {
              return const Center(child: Text("données envoyé avec succès"));
            } else {
              return const Center(
                  child: Text("Erreur lors de l'envoie des données"));
            }
          },
        ),
      ),
    );
  }
}
