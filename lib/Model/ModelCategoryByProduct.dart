import 'dart:convert';

ModelCategoryByProduct modelCategoryByProductFromJson(String str) => ModelCategoryByProduct.fromJson(json.decode(str));

String modelCategoryByProductToJson(ModelCategoryByProduct data) => json.encode(data.toJson());

class ModelCategoryByProduct {
  ModelCategoryByProduct({
    this.status,
    this.data,
  });

  String status;
  List<DataCategoryByP> data;

  factory ModelCategoryByProduct.fromJson(Map<String, dynamic> json) => ModelCategoryByProduct(
    status: json["status"],
    data: List<DataCategoryByP>.from(json["data"].map((x) => DataCategoryByP.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCategoryByP {
  DataCategoryByP({
    this.id,
    this.name,
    this.products,
  });

  int id;
  String name;
  List<ProductCat> products;

  factory DataCategoryByP.fromJson(Map<String, dynamic> json) => DataCategoryByP(
    id: json["id"],
    name: json["name"],
    products: List<ProductCat>.from(json["products"].map((x) => ProductCat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class ProductCat {
  ProductCat({
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

  factory ProductCat.fromJson(Map<String, dynamic> json) => ProductCat(
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
