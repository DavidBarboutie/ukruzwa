import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test01/data/datasource/remote/firebase.dart';
import 'package:test01/presentation/bloc/home_event.dart';
import 'package:test01/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState("")) {
    on<HomeEvent>((event, emit) async {
      String name = await getDataInFirebase();
      emit(HomeState(name));
    });
  }
}
