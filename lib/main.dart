import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/presentation/pages/formulaire_salle_spectacle.dart';
import 'package:ukruzwa/utils/constants/firebase_options.dart';
import 'package:ukruzwa/presentation/bloc/home/home_bloc.dart';
import 'package:ukruzwa/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<HomeBloc>(create: (_) => HomeBloc())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SalleSpectacle());
  }
}
