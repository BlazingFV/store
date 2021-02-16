import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Control/control_Home.dart';
import 'package:Khaldiya/Model/ModelCategories.dart';
import 'package:Khaldiya/View/CustomWidget/Wid_Catogry.dart';
import 'package:flutter/material.dart';
import '../Categorie/screan_Categorie.dart';
import 'package:get/get.dart';

class main_Categories extends StatelessWidget {
  const main_Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final control_Home  _control = Get.put(control_Home());
    return Container(
      margin: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 10),
      height: 90,
      child: Obx(()=> ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount:_control.listCategories.length,
        itemBuilder: (context, index) {
          DataCategories cat = _control.listCategories[index];
          return Wid_Catogry(
              categories: DataCategories(
                name: cat.name,
                image: cat.image,
              ),
              onTap: (){Get.to(screan_Categorie(
                id: cat.id,
                imageCategorie: cat.image,
                nameCategorie: cat.name,
              ),);}
          );
        },
      ),)
    );
  }
}
