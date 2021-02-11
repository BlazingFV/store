import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCategories.dart';
import 'package:Khaldiya/Model/ModelCategoryByProduct.dart';
import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
import 'package:Khaldiya/View/Home/sub_Categories.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:Khaldiya/View/cart/screan_Cart.dart';
import 'package:Khaldiya/View/Categorie/screan_Categorie.dart';
import 'package:Khaldiya/View/product/screan_Producte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CustomWidget/MyDrawer.dart';
import '../CustomWidget/Wid_product.dart';
import '../CustomWidget/Wid_Catogry.dart';
import 'Slider.dart';
import '../CustomWidget/WidgetApp.dart';
import 'main_Categories.dart';

class HomeApp extends StatefulWidget {
  static String id = "HomeAppK";
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //=================================AppBar===============
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("الجابرية", style: TextStyle(fontSize: an.fontSize())),
        actions: <Widget>[
          FutureBuilder(
            future: apiGetCart(),
            builder: (context, snapshot) {
              return Button_CartAppBar(
                  context: context,
                  cartLength: getCart.length.toString() ?? "",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => screan_Cart()));
                  });
            },
          ),
        ],
      ),

      //=================================drawer===============

      drawer: MyDrawer(),

      //=================================body===============
      body: FutureBuilder(
        future: Future.wait([
          apiCategories(),
          apicategoryByProduct(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                //----SliverList Widget-----------------

                SliverList(delegate: SliverChildListDelegate([

                  //==================SlideShow===================
                  Wid_slideShow(),

                  //================اقسام التطبيق الفرعية =========================
                  main_Categories(),

                ])),

                //================اقسام التطبيق الفرعية الثانية =========================
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      DataCategoryByP mainCat = categoryByProduct[index];
                      return sub_Categories(mainCat: mainCat);
                    },
                    childCount: categoryByProduct.length == null ? 0 : categoryByProduct.length,
                  ),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
