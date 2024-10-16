import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ukruzwa/data/datasource/remote/firebase.dart';
import 'package:ukruzwa/presentation/bloc/home_state.dart';
import 'package:ukruzwa/presentation/bloc/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeStateInitial("")) {
    on<HomeEvent>((event, emit) async {
      String name = await getDataInFirebase();
      emit(HomeStateInitial(name));
    });

    on<AddDataEvent>((event, emit) async {
      bool send = await setDataInFirebase(event.name);
      emit(AddDataState(send));
    });

    on<AuthEvent>((event, emit) async {
      bool send = await Auth(event.email, event.pwd);
      emit(AddDataState(send));
    });
  }
}
