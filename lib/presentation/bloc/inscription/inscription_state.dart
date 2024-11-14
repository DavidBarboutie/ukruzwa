sealed class InscriptionState {
  const InscriptionState();
}

class InscriptionStateInitial extends InscriptionState {
  const InscriptionStateInitial() : super();
}

class AddDataState extends InscriptionState {
  final bool send;
  const AddDataState(this.send) : super();
}
