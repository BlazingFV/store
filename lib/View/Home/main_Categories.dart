import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCategories.dart';
import 'package:Khaldiya/View/CustomWidget/Wid_Catogry.dart';
import 'package:flutter/material.dart';
import '../Categorie/screan_Categorie.dart';

class main_Categories extends StatelessWidget {
  const main_Categories({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 10),
      height: 90,
      child: ListView.builder(
       scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: dataCategories.length == null ? 0 : dataCategories.length,
        itemBuilder: (context, index) {
          DataCategories cat = dataCategories[index];
          return Wid_Catogry(
            categories: DataCategories(
              name: cat.name,
              image: cat.image,
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screan_Categorie(
                    id: cat.id,
                    imageCategorie: cat.image,
                    nameCategorie: cat.name,
                  ),
                )),
          );
        },
      ),
    );
  }
}