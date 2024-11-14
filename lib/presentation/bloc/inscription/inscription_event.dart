class InscriptionEvent {
  const InscriptionEvent();
}

class AddDataInscriptionEvent extends InscriptionEvent {
  final String? nomGrp;
  final String? styleGrp;
  final String? setList;
  final String? nom;
  final String? prenom;
  final String? numTel;
  final String? numTelRemplacement;
  final String? adresseContact;
  final String? adresseRepet;
  final String? instrumentsJouees;
  final String? chanteur;
  final int? prixMinGrp;
  final String? endroitGrpAjouer;
  final bool? sono;

  const AddDataInscriptionEvent(
    this.nomGrp,
    this.styleGrp,
    this.setList,
    this.nom,
    this.prenom,
    this.numTel,
    this.numTelRemplacement,
    this.adresseContact,
    this.adresseRepet,
    this.instrumentsJouees,
    this.chanteur,
    this.prixMinGrp,
    this.endroitGrpAjouer,
    this.sono,
  ) : super();
}

class RetourEvent extends InscriptionEvent {
  RetourEvent() : super();
}
