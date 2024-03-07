/*   class CategoriesResponse {
  String status;
  List<Data> data;

  CategoriesResponse({required this.status, required this.data}) {
    data = [];
  }

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = [];
    if (json['data'] != null) {
      data = List<Data>.from(json['data'].map((v) => Data.fromJson(v)));
    }
  }
}

class Data {
  int id;
  String entrepriseCategorie;
  String createdAt;
  String updatedAt;

  Data({this.id, this.entrepriseCategorie, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entrepriseCategorie = json['entreprise_categorie'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entreprise_categorie'] = this.entrepriseCategorie;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
 */