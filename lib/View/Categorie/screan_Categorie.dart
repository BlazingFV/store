import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:Khaldiya/View/product/screan_Producte.dart';
import 'package:flutter/material.dart';
import '../CustomWidget/MyDrawer.dart';
import '../CustomWidget/Wid_product.dart';
import 'package:get/get.dart';

class screan_Categorie extends StatefulWidget {
  final int id;
  final String imageCategorie, nameCategorie;
  const screan_Categorie(
      {Key key, this.id, this.imageCategorie, this.nameCategorie})
      : super(key: key);

  @override
  _screan_CategorieState createState() => _screan_CategorieState();
}

class _screan_CategorieState extends State<screan_Categorie> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //=================================drawer===============
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: an.text(widget.nameCategorie),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),

        //=================================drawer===============
        drawer: MyDrawer(),

        //=================================body===============
        body: FutureBuilder(
          future: apiProductCateroy(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[


                  //---- SliverList Widget Header Image -----------------
                  // SliverList(
                  //     delegate: SliverChildListDelegate([
                  //   new Container(
                  //     height: 180,
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: NetworkImage("${widget.imageCategorie}"))),
                  //     child: Center(
                  //       child: an.text(widget.nameCategorie),
                  //     ),
                  //   ),
                  // ])),

                  //---SliverGrid Product-----------------
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          DataCateroy producte = dataProductCateroy[index];
                          return Wid_product(
                            product: DataCateroy(
                              name: producte.name,
                              image: producte.image,
                              productPrice: producte.productPrice,
                              productRealPrice: producte.productRealPrice,
                            ),
                            onTapAddToCart: () {print("اضافة المنتج للسلة$index");},
                            onTapProducte: () {Get.to(ScreenProduct(id: producte.id,));},
                          );
                        },
                        childCount: dataProductCateroy.length == null ? 0 : dataProductCateroy.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 10)),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
