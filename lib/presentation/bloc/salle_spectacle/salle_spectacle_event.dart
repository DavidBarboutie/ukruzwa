class SalleSpectacleEvent {
  const SalleSpectacleEvent();
}

class AddDataSalleSpectacleEvent extends SalleSpectacleEvent {
  final String? nom;
  final String? adresseRue;
  final String? adresseVille;
  final int? nbplaceMax;
  final String? structure;
  final bool? sono;

  const AddDataSalleSpectacleEvent(
    this.nom,
    this.adresseRue,
    this.adresseVille,
    this.nbplaceMax,
    this.structure,
    this.sono,
  ) : super();
}

class RetourEvent extends SalleSpectacleEvent {
  RetourEvent() : super();
}
