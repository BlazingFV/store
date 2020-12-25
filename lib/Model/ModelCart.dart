// To parse this JSON data, do
//
//     final modelCart = modelCartFromJson(jsonString);

import 'dart:convert';

ModelCart modelCartFromJson(String str) => ModelCart.fromJson(json.decode(str));

String modelCartToJson(ModelCart data) => json.encode(data.toJson());

class ModelCart {
  ModelCart({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory ModelCart.fromJson(Map<String, dynamic> json) => ModelCart(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.info,
    this.products,
    this.totaShippingCost,
    this.totalPrice,
    this.total,
  });

  Info info;
  List<MProduct> products;
  String totaShippingCost;
  String totalPrice;
  String total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    info: Info.fromJson(json["info"]),
    products: List<MProduct>.from(json["products"].map((x) => MProduct.fromJson(x))),
    totaShippingCost: json["totaShippingCost"],
    totalPrice: json["TotalPrice"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "totaShippingCost": totaShippingCost,
    "TotalPrice": totalPrice,
    "total": total,
  };
}

class Info {
  Info({
    this.orderId,
  });

  int orderId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
  };
}

class MProduct{
  MProduct({
    this.id,
    this.image,
    this.qty,
    this.price,
    this.name,
  });

  int id;
  String image;
  int qty;
  double price;
  String name;

  factory MProduct.fromJson(Map<String, dynamic> json) => MProduct(
    id: json["id"],
    image: json["image"],
    qty: json["Qty"],
    price: json["price"].toDouble(),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "Qty": qty,
    "price": price,
    "name": name,
  };
}
