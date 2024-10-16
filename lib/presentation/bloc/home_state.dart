import 'package:ukruzwa/presentation/pages/home.dart';

abstract class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  final String name;
  const HomeStateInitial(this.name) : super();
}

class AddDataState extends HomeState {
  final bool send;
  const AddDataState(this.send) : super();
}
