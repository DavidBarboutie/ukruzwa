class InscriptionEvent {
  const InscriptionEvent();
}

class AddDataEvent extends InscriptionEvent {
  final String name;
  const AddDataEvent(this.name) : super();
}
