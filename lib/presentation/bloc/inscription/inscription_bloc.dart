import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/data/datasource/remote/firebase.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionBloc> {
  InscriptionBloc()
      : super(const InscriptionStateInitial() as InscriptionBloc) {
    // on<HomeEvent>((event, emit) async {
    //   String name = await getDataInFirebase();
    //   emit(HomeStateInitial(name));
    // });

    // on<AddDataEvent>((event, emit) async {
    //   bool send = await setDataInFirebase(event.name);
    //   emit(AddDataState(send));
    // });
  }
}
