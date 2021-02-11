import 'package:Khaldiya/Model/ModelCategoryByProduct.dart';
import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
import 'package:Khaldiya/View/CustomWidget/Wid_product.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:flutter/material.dart';
import '../Details product/screan_Producte.dart';
import 'package:get/get.dart';

class sub_Categories extends StatelessWidget {
  const sub_Categories({Key key, @required this.mainCat,}) : super(key: key);
  final DataCategoryByP mainCat;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.white,
      initiallyExpanded: false,
      maintainState: false,
      childrenPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      expandedAlignment: Alignment.center,
      title: Text("${mainCat.name}", style: TextStyle(fontSize: an.fontSize())),
      children: <Widget>[

        new Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mainCat.products.length,
              itemBuilder: (context, index) {
                ProductCat product = mainCat.products[index];
                return Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: Wid_product(
                      product: DataCateroy(
                        name: product.name,
                        image: product.image,
                        productPrice: product.productPrice,
                        productRealPrice: product.productRealPrice,
                      ),
                      onTapAddToCart: () {},
                      onTapProducte: () {
                        Get.to(ScreenProduct(
                          id: product.id,
                        ));
                      },
                    ));
              },
            ))
      ],
    );
  }
}
