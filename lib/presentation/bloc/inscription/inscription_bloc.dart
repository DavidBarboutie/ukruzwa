import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/data/datasource/remote/firebase.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_state.dart';
import 'package:ukruzwa/presentation/bloc/inscription/inscription_event.dart';

class InscriptionBloc extends Bloc<InscriptionEvent, InscriptionState> {
  InscriptionBloc() : super(const InscriptionStateInitial()) {
    // on<HomeEvent>((event, emit) async {
    //   String name = await getDataInFirebase();
    //   emit(HomeStateInitial(name));
    // });

    // on<AddDataEvent>((event, emit) async {
    //   bool send = await setDataInFirebase(event.name);
    //   emit(AddDataState(send));
    // });

    on<RetourEvent>((event, emit) async {
      emit(const InscriptionStateInitial());
    });
  }
}
