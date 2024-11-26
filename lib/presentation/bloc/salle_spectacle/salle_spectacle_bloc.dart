import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/domain/models/salle_spectacle_class.dart';
import 'package:ukruzwa/presentation/bloc/salle_spectacle/salle_spectacle_state.dart';
import 'package:ukruzwa/presentation/bloc/salle_spectacle/salle_spectacle_event.dart';

class SalleSpectacleBloc
    extends Bloc<SalleSpectacleEvent, SalleSpectacleState> {
  SalleSpectacleBloc() : super(const SalleSpectacleStateInitial()) {
    on<AddDataSalleSpectacleEvent>((event, emit) async {
      final sonoTemp = SalleSpectacleClass(
        nom: event.nom,
        adresseRue: event.adresseRue,
        adresseVille: event.adresseVille,
        nbplaceMax: event.nbplaceMax,
        structure: event.structure,
      );
      sonoTemp.create();
    });

    on<RetourEvent>((event, emit) async {
      emit(const SalleSpectacleStateInitial());
    });
  }
}
