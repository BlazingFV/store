  import 'dart:async';
  import 'dart:convert';
  import 'package:Khaldiya/Model/ModelCart.dart';
  import 'package:Khaldiya/Model/ModelCategories.dart';
  import 'package:Khaldiya/Model/ModelCategoryByProduct.dart';
  import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
  import 'package:Khaldiya/Model/ModelProductDetails.dart';
  import 'package:http/http.dart' as http;
  import 'package:shared_preferences/shared_preferences.dart';


  String UrlApi = "http://khedmtk.com/jabria/api";

  String MacAddress;

  // ربط الاقسام التي تحت السلايدر ========
  List dataCategories = [];
  Future apiCategories() async {
    String url = "$UrlApi/category";
    var response = await http.get(url, headers: {'lang': 'ar'});
    var categories = modelCategoriesFromJson(response.body);
    dataCategories = categories.data;
  }

  // ربط القسم الفرعي التي تحت السلايدر ========
  List dataProductCateroy = [];
  Future apiProductCateroy({int id}) async {
    String url = "$UrlApi/get/product/$id";
    var response = await http.get(url, headers: {'lang': 'ar'});
    var productCateroy = modelCateroyproductFromJson(response.body);
    dataProductCateroy = productCateroy.data;
  }

  // ربط الاقسام التي بداخلها المنتجات الي في الصفحة الاولي  ========
  List categoryByProduct = [];
  Future apicategoryByProduct() async {
    String url = "$UrlApi/categoryByProduct";
    var response = await http.get(url, headers: {'lang': 'ar'});
    var dataCategory = modelCategoryByProductFromJson(response.body);
    categoryByProduct = dataCategory.data;
  }

  // تفاصيل المنتج ========
  var dataProduct;
  Future<ModelProductDetails> apiproductDetails({int id}) async {
    String url = "$UrlApi/product/details/$id";
    var response = await http.get(url, headers: {'lang': 'ar'});
    var ProductDetails = modelProductDetailsFromJson(response.body);
    dataProduct = ProductDetails.data;
  }

  //  =============== اضافة المنتج للسلة ========
  Future apiAddCart({productId, quantity, price , mac_address}) async {
    String url = "$UrlApi/add/cart";
    var response = await http.post(url, body: {
      'mac_address': "$mac_address",
      'product_id': '$productId',
      'quantity': '$quantity',
      'price': '$price',
    }).then((request) {
      var res = jsonDecode(request.body);
      if (request.body.contains("message")) {
        print(res["message"]);
      } else if (request.body.contains("error")) {
        print(res["error"]);
      } else {
        print("Done");
      }
    }).catchError((error) {
      print(error);
    });
  }

  //  =============== عرض المنتجات في السلة ========
  List getCart = [];
  var getDataCart;
  Future apiGetCart({String macAddress}) async {
    String url = "$UrlApi/get/cart";
    var response = await http.post(url, headers: {
      'lang': 'Ar'
    }, body: {
      'mac_address': '$macAddress',
    });
    var cart = modelCartFromJson(response.body);
    getCart = cart.data.products;
    getDataCart = cart.data;
  }

  //======  Delete Product from cart ==================================
  Future apiDeleteProduct({int order_id, product_order_id}) async {
    String url = "$UrlApi/delete/cart";
    var response = await http.post(url, body: {
      'order_id': "$order_id",
      'product_order_id': '$product_order_id'
    }).then((request) {
      var res = jsonDecode(request.body);
      if (request.body.contains("message")) {
        print(res["message"]);
      } else if (request.body.contains("error")) {
        print(res["error"]);
      } else {
        print("else");
      }
    }).catchError((error) {
      print("catchError : $error");
    });
  }


  //============ Edit Quantity  ==================================
  Future apiEditQuantity({product_order_id ,type})async{
    String url = "$UrlApi/edit/cart";
    var response = await http.post(url,body: {
      'product_order_id' : '$product_order_id',
      'type' : '$type',
    }).then((request){
      var res =  jsonDecode(request.body);
      if (request.body.contains("message")) {
        print(res["message"]);
      } else if (request.body.contains("error")) {
        print(res["error"]);
      } else {
        print("else");
      }
    }).catchError((error){
      print("Error $error");
    });
  }



