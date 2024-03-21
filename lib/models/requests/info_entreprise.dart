class EntrepriseInfoRequest {
  String nomCommercial;
  String nomEntreprise;
  int idUser;
  int idEntrepriseCategorie;
  String codePays;
  String telephone;
  String adresse;
  String pays;

  EntrepriseInfoRequest(
      {required this.nomCommercial,
      required this.nomEntreprise,
      required this.idUser,
      required this.idEntrepriseCategorie,
      required this.codePays,
      required this.telephone,
      required this.adresse,
      required this.pays});

  factory EntrepriseInfoRequest.fromJson(Map<String, dynamic> json) {
    return EntrepriseInfoRequest(
      nomCommercial: json['nomCommercial'],
      nomEntreprise: json['nomEntreprise'],
      idUser: json['idUser'],
      idEntrepriseCategorie: json['idEntrepriseCategorie'],
      codePays: json['codePays'],
      telephone: json['telephone'],
      adresse: json['adresse'],
      pays: json['pays'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomCommercial'] = this.nomCommercial;
    data['nomEntreprise'] = this.nomEntreprise;
    data['idUser'] = this.idUser;
    data['idEntrepriseCategorie'] = this.idEntrepriseCategorie;
    data['codePays'] = this.codePays;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['pays'] = this.pays;
    return data;
  }
}
