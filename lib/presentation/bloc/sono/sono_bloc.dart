import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/data/datasource/remote/firebase.dart';
import 'package:ukruzwa/domain/models/sono_class.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_state.dart';
import 'package:ukruzwa/presentation/bloc/sono/sono_event.dart';

class SonoBloc extends Bloc<SonoEvent, SonoState> {
  SonoBloc() : super(const SonoStateInitial()) {
    on<AddDataSonoEvent>((event, emit) async {
      final sonoTemp = SonoClass(
        ingeSon: event.ingeSon,
        professionnel: event.professionnel,
        modeleSono: event.modeleSono,
        puissanceSono: event.puissanceSono,
        prixLocSono: event.prixLocSono,
        prixLocInge: event.prixLocInge,
      );
      sonoTemp.createSono();
    });

    on<RetourEvent>((event, emit) async {
      emit(const SonoStateInitial());
    });
  }
}
