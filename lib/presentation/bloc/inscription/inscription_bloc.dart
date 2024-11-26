import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/domain/models/candidat_class.dart';
import 'package:ukruzwa/domain/models/contact_class.dart';
import 'package:ukruzwa/domain/models/group_class.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState> {
  InscriptionBloc() : super(const InscriptionStateInitial()) {
    // on<InscriptionEvent>((event, emit) async {
    //   String name = await getDataInFirebase();
    //   emit(InscriptionStateInitial(name));
    // });

    on<AddDataInscriptionEvent>((event, emit) async {
      final grouptemp = GroupClass(
        nomGroupe: event.nomGrp,
        setList: event.setList,
        styles: event.styleGrp,
        adresseRepet: event.adresseRepet,
        nbChanteurs: event.chanteur,
        prixMin: event.prixMinGrp,
        endroitJouee: event.endroitGrpAjouer,
      );
      grouptemp.createGroup();

      final candidatTemp = CandidatClass(
        numTel: event.numTel,
        numTelBackup: event.numTelRemplacement,
      );
      candidatTemp.createCandidat();

      final contactTemp = ContactClass(
        nom: event.nom,
        prenom: event.prenom,
        adresseContact: event.adresseContact,
      );
      contactTemp.createContact();
    });

    on<RetourEvent>((event, emit) async {
      emit(const InscriptionStateInitial());
    });
  }
}
