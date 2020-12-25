import 'package:flutter/material.dart';

class Data_productes{

  String name,description,image;
  bool isActive;
  int Quantity;
  int requiredQuantity = 1;
  double price,priceDiscount;

  Data_productes({
    this.name,
    this.price,
    this.requiredQuantity,
    this.priceDiscount,
    this.Quantity,
    this.description,
    this.image,
    this.isActive
  });
}

List<Data_productes> data_productes = [

  Data_productes(
    name: "بطاطا نقوه 1 كج- اردني",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/c/o/coconut-03.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 1.495,
    priceDiscount: 2.495,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),


  Data_productes(
    name: "كوسا نقوه 1كج- اردني",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/p/a/papya.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 1.999,
    priceDiscount: 2.999,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),

  Data_productes(
    name: "برتقال عصير افريقي كيلو",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/r/e/red_1.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 2.555,
    priceDiscount: 1.555,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),

  Data_productes(
    name: "موز شكيتا كيلو",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/i/s/istock_000012155403small_honeydew_-_yellow__65180.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 2.495,
    priceDiscount: 2.495,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),

  Data_productes(
    name: "كمثري كيلو",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/c/a/calamanci.gif",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 1.259,
    priceDiscount: 1.259,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),


  Data_productes(
    name: "بطاطا لبناني خيشة 4 كيلو",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/c/h/china_pear-1000x1000.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 1.250,
    priceDiscount: 1.250,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),


  Data_productes(
    name: "نعناع فريش",
    image: "https://www.kandmore.com/riyadh/ar/media/catalog/product/cache/4/small_image/300x300/3926ad70021aa4353b2ec9fc8f80bf41/q/u/quince-imported-03.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price:1.155,
    priceDiscount: 3.155,
    isActive: false,
    Quantity: 1,
    requiredQuantity: 1,
    ),


  Data_productes(
    name: "خوخ اردني مدور 1 كيلو",
    image: "https://www.kwamazon.com/ecomadm/Resources/3/Ecommerce/ItemImage/2524-2.jpg",
    description: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
    price: 1.250,
    priceDiscount: 1.255,
    isActive: false,
    Quantity:1,
    requiredQuantity: 1,
    ),

];