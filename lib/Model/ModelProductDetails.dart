
import 'dart:convert';

ModelProductDetails modelProductDetailsFromJson(String str) => ModelProductDetails.fromJson(json.decode(str));

String modelProductDetailsToJson(ModelProductDetails data) => json.encode(data.toJson());

class ModelProductDetails {
  ModelProductDetails({
    this.status,
    this.data,
  });

  String status;
  DataProduct data;

  factory ModelProductDetails.fromJson(Map<String, dynamic> json) => ModelProductDetails(
    status: json["status"],
    data: DataProduct.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataProduct {
  DataProduct({
    this.procuctId,
    this.catId,
    this.productArName,
    this.productEnName,
    this.createdAt,
    this.updatedAt,
    this.productImagePath,
    this.productStatus,
    this.productPrice,
    this.productRealPrice,
    this.productArDesc,
    this.productEnDesc,
  });

  int procuctId;
  int catId;
  String productArName;
  String productEnName;
  DateTime createdAt;
  DateTime updatedAt;
  String productImagePath;
  int productStatus;
  String productPrice;
  String productRealPrice;
  String productArDesc;
  String productEnDesc;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
    procuctId: json["ProcuctID"],
    catId: json["CatID"],
    productArName: json["ProductArName"],
    productEnName: json["ProductEnName"],
    createdAt: DateTime.parse(json["Created_At"]),
    updatedAt: DateTime.parse(json["Updated_At"]),
    productImagePath: json["ProductImagePath"],
    productStatus: json["ProductStatus"],
    productPrice: json["ProductPrice"],
    productRealPrice: json["ProductRealPrice"],
    productArDesc: json["ProductArDesc"],
    productEnDesc: json["ProductEnDesc"],
  );

  Map<String, dynamic> toJson() => {
    "ProcuctID": procuctId,
    "CatID": catId,
    "ProductArName": productArName,
    "ProductEnName": productEnName,
    "Created_At": createdAt.toIso8601String(),
    "Updated_At": updatedAt.toIso8601String(),
    "ProductImagePath": productImagePath,
    "ProductStatus": productStatus,
    "ProductPrice": productPrice,
    "ProductRealPrice": productRealPrice,
    "ProductArDesc": productArDesc,
    "ProductEnDesc": productEnDesc,
  };
}
