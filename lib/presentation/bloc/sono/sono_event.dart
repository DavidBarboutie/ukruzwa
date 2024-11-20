class SonoEvent {
  const SonoEvent();
}

class AddDataSonoEvent extends SonoEvent {
  final bool? ingeSon;
  final bool? professionnel;
  final String? modeleSono;
  final String? puissanceSono;
  final int? prixLocSono;
  final int? prixLocInge;

  const AddDataSonoEvent(
    this.ingeSon,
    this.professionnel,
    this.modeleSono,
    this.puissanceSono,
    this.prixLocSono,
    this.prixLocInge,
  ) : super();
}

class RetourEvent extends SonoEvent {
  RetourEvent() : super();
}
