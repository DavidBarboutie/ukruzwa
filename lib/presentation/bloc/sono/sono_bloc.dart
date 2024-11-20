import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/data/datasource/remote/firebase.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_state.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_event.dart';

class SonoBloc extends Bloc<SonoEvent, SonoState> {
  SonoBloc() : super(const SonoStateInitial()) {
    on<AddDataSonoEvent>((event, emit) async {
      createSono(
        event.ingeSon,
        event.professionnel,
        event.modeleSono,
        event.puissanceSono,
        event.prixLocSono,
        event.prixLocInge,
      );
    });

    on<RetourEvent>((event, emit) async {
      emit(const SonoStateInitial());
    });
  }
}
