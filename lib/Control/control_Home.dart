import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCategories.dart';
import 'package:Khaldiya/Model/ModelCategoryByProduct.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class control_Home extends GetxController {

  Future categories ;
  Future categoryByProduct ;
  var isLoading = true.obs;
  var listCategories = List<DataCategories>().obs;
  var listCategoriesByP= List<DataCategoryByP>().obs;


  //======== fetch Categories By Product =========================
  Future fetchCategoriesByP()async{
    try{
      var categoriesByP = await RemoteServices.apicategoryByProduct();
      if(categoriesByP != null){
        listCategoriesByP.assignAll(categoriesByP);
      }
    }finally{
    }
  }


  //======== fetch Categories ====================================
  Future fetchCategories() async {
    isLoading(true);
    try{
      var categories = await RemoteServices.apiCategorie();
      if (categories != null) {
        listCategories.assignAll(categories);
      }
    }finally{
      isLoading(true);
    }
  }


  //======== onInit ====================================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
    fetchCategoriesByP();
    categories = fetchCategories();
    categoryByProduct = fetchCategoriesByP();
  }
}
