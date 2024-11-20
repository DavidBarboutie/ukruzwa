sealed class SonoState {
  const SonoState();
}

class SonoStateInitial extends SonoState {
  const SonoStateInitial() : super();
}

class AddDataState extends SonoState {
  final bool send;
  const AddDataState(this.send) : super();
}
