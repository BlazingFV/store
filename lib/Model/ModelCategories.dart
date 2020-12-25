import 'dart:convert';

ModelCategories modelCategoriesFromJson(String str) => ModelCategories.fromJson(json.decode(str));

String modelCategoriesToJson(ModelCategories data) => json.encode(data.toJson());

class ModelCategories {
  ModelCategories({
    this.status,
    this.data,
  });

  String status;
  List<DataCategories> data;

  factory ModelCategories.fromJson(Map<String, dynamic> json) => ModelCategories(
    status: json["status"],
    data: List<DataCategories>.from(json["data"].map((x) => DataCategories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCategories {
  DataCategories({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory DataCategories.fromJson(Map<String, dynamic> json) => DataCategories(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
