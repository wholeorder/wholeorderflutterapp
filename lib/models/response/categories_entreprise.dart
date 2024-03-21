/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myCategoriesEntrepriseNode = CategoriesEntreprise.fromJson(map);
*//* 
class DataCategoriesEntreprise {
  int? id;
  String? entreprisecategorie;
  DateTime? createdat;
  DateTime? updatedat;

  DataCategoriesEntreprise({this.id, this.entreprisecategorie, this.createdat, this.updatedat});

  DataCategoriesEntreprise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entreprisecategorie = json['entreprise_categorie'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['entreprise_categorie'] = entreprisecategorie;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}
 */

class DataCategoriesEntreprise {
  int? id;
  String? entreprisecategorie;
  DateTime? createdat;
  DateTime? updatedat;

  DataCategoriesEntreprise(
      {this.id, this.entreprisecategorie, this.createdat, this.updatedat});

  DataCategoriesEntreprise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entreprisecategorie = json['entreprise_categorie'];
    createdat = DateTime.tryParse(json['created_at']);
    updatedat = DateTime.tryParse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['entreprise_categorie'] = entreprisecategorie;
    data['created_at'] = createdat?.toIso8601String();
    data['updated_at'] = updatedat?.toIso8601String();
    return data;
  }
}
class CategoriesEntreprise {
  String? status;
  List<DataCategoriesEntreprise?>? data;

  CategoriesEntreprise({this.status, this.data});

  CategoriesEntreprise.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataCategoriesEntreprise>[];
      json['data'].forEach((v) {
        data!.add(DataCategoriesEntreprise.fromJson(v));
      });
    }
  }

 /*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['data'] = data != null ? data!.map((v) => v?.toJson()).toList() : null;
    return data;
  } */

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['data'] = data != null
        ? data.map((key, value) => MapEntry(key, value?.toJson()))
        : null;
    return data;
  }
}
