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
      bool send = await setNomGrp(event.nomGrp);
      setStyleGrp(event.styleGrp);
      setSetList(event.setList);
      setNom(event.nom);
      setPrenom(event.prenom);
      setNumTel(event.numTel);
      setNumTelRemplacement(event.numTelRemplacement);
      setAdresseContact(event.adresseContact);
      setAdresseRepet(event.adresseRepet);
      setAdresseContact(event.adresseContact);
      setsInstrumentsJouees(event.instrumentsJouees);
      setChanteur(event.chanteur);
      setsPrixMinGrp(event.prixMinGrp);
      setEndroitGrpAjouer(event.endroitGrpAjouer);
      setSono(event.sono);
      emit(AddDataState(send));
    });

    on<RetourEvent>((event, emit) async {
      emit(const InscriptionStateInitial());
    });
  }
}
