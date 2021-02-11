import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Control/control_Home.dart';
import 'package:Khaldiya/Model/ModelCategoryByProduct.dart';
import 'package:Khaldiya/View/Home/sub_Categories.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:Khaldiya/View/cart/screan_Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CustomWidget/MyDrawer.dart';
import 'Slider.dart';
import '../CustomWidget/WidgetApp.dart';
import 'main_Categories.dart';
import 'package:get/get.dart';

class HomeApp extends StatelessWidget {
  final control_Home _control = Get.put(control_Home());
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
                    Get.to(screan_Cart());
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
          _control.categoryByProduct,
          _control.categories,
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                //----SliverList Widget-----------------

                SliverList(
                    delegate: SliverChildListDelegate([
                  //==================SlideShow===================
                  Wid_slideShow(),

                  //================اقسام التطبيق الفرعية =========================
                  main_Categories(),
                ])),

                //================اقسام التطبيق الفرعية الثانية =========================
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    DataCategoryByP mainCat = _control.listCategoriesByP[index];
                    return sub_Categories(mainCat: mainCat);
                  },
                      childCount: _control.listCategoriesByP.length == null ? 0 : _control.listCategoriesByP.length),
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
