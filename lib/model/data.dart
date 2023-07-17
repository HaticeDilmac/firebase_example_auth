// ignore_for_file: camel_case_types, empty_constructor_bodies
class DataModels {
  final List<DataModel> data;
  DataModels({required this.data});

  factory DataModels.fromJson(Map<String, dynamic>? json) {
    List<DataModel> data =
        []; //Boş bir liste oluşturucaz ve jsonu parçalayacağız.
    if (json != null)
      for (var i in json['data']) {
        //bu bir liste ve data listesini döndür ve ide tanımla
        data.add(
            DataModel.fromJson(i)); //i yani listeyi içersine vermiş oluyoruz
      }
    return DataModels(data: data);
  }
}

class DataModel {
  final String name;
  final String password;
  final String mail;
  DataModel({required this.name, required this.password, required this.mail});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'], password: json['password'], mail: json['mail']);
  }
}
