import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/data/datasource/remote/firebase.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState> {
  InscriptionBloc() : super(const InscriptionStateInitial()) {
    // on<InscriptionEvent>((event, emit) async {
    //   String name = await getDataInFirebase();
    //   emit(InscriptionStateInitial(name));
    // });

    on<AddDataInscriptionEvent>((event, emit) async {
      createGroup(
        event.nomGrp,
        event.setList,
        event.styleGrp,
        event.adresseRepet,
        event.chanteur,
        event.prixMinGrp,
        event.endroitGrpAjouer,
      );

      createCandidat(
        event.numTel,
        event.numTelRemplacement,
      );

      createContact(
        event.nom,
        event.prenom,
        event.adresseContact,
      );
    });

    on<RetourEvent>((event, emit) async {
      emit(const InscriptionStateInitial());
    });
  }
}
