// To parse this JSON data, do
//
//     final modelCateroyproduct = modelCateroyproductFromJson(jsonString);

import 'dart:convert';

ModelCateroyProduct modelCateroyproductFromJson(String str) => ModelCateroyProduct.fromJson(json.decode(str));

String modelCateroyproductToJson(ModelCateroyProduct data) => json.encode(data.toJson());

class ModelCateroyProduct {
  ModelCateroyProduct({
    this.status,
    this.data,
  });

  String status;
  List<DataCateroy> data;

  factory ModelCateroyProduct.fromJson(Map<String, dynamic> json) => ModelCateroyProduct(
    status: json["status"],
    data: List<DataCateroy>.from(json["data"].map((x) => DataCateroy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCateroy {
  DataCateroy({
    this.id,
    this.name,
    this.image,
    this.productPrice,
    this.productRealPrice,
  });

  int id;
  String name;
  String image;
  String productPrice;
  String productRealPrice;

  factory DataCateroy.fromJson(Map<String, dynamic> json) => DataCateroy(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    productPrice: json["ProductPrice"],
    productRealPrice: json["ProductRealPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "ProductPrice": productPrice,
    "ProductRealPrice": productRealPrice,
  };
}
