import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/LocalData/Data_productes.dart';
import 'package:Khaldiya/Model/ModelCategories.dart';
import 'package:Khaldiya/Model/ModelCategoryByProduct.dart';
import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
import 'package:Khaldiya/StateManagement/State_Cart.dart';
import 'package:Khaldiya/View/screan_Cart.dart';
import 'package:Khaldiya/View/screan_Categorie.dart';
import 'package:Khaldiya/View/screan_Producte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import 'CustomWidget/MyDrawer.dart';
import './CustomWidget/Wid_product.dart';
import 'CustomWidget/Wid_Catogry.dart';
import 'CustomWidget/Wid_SlideShow.dart';
import 'package:provider/provider.dart';
import 'CustomWidget/WidgetApp.dart';



class HomeApp extends StatefulWidget {
  static String id = "HomeAppK";
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation == Orientation.portrait
        ? heightQuery * 0.022
        : widthQuery * 0.022;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Consumer<State_Cart>(
        builder: (context, cart, child) => Scaffold(
          backgroundColor: Colors.white,

          //=================================AppBar===============
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text("الجابرية", style: TextStyle(fontSize: fontsize)),
            actions: <Widget>[
              FutureBuilder(
                future: apiGetCart(),
                builder: (context, snapshot) {
                  return Button_CartAppBar(
                      context: context,
                      cart: cart,
                      cartLength: getCart.length.toString() ?? "",
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => screan_Cart()));}
                  );
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
                    SliverList(
                        delegate: SliverChildListDelegate([
                      //==================SlideShow===================
                      Wid_slideShow(),

                      //================اقسام التطبيق الفرعية =========================

                      Container(
                        margin: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 10),
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: dataCategories.length,
                          itemBuilder: (context, index) {
                            DataCategories cat = dataCategories[index];
                            return Wid_Catogry(
                              categories: DataCategories(
                                name: cat.name,
                                image: cat.image,
                              ),
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screan_Categorie(
                                      id: cat.id,
                                      imageCategorie: cat.image,
                                      nameCategorie: cat.name,
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                    ])),

                    //================اقسام التطبيق الفرعية الثانية =========================
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          DataCategoryByP mainCat = categoryByProduct[index];
                          return ExpansionTile(
                            backgroundColor: Colors.white,
                            initiallyExpanded: true,
                            maintainState: false,
                            childrenPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                            expandedAlignment: Alignment.center,
                            title: Text("${mainCat.name}", style: TextStyle(fontSize: fontsize,)),
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
                                            onTapAddToCart: () {cart.add(data_productes[index]);},

                                            onTapProducte: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)
                                             => screan_Producte(id: product.id,),));
                                            },

                                          ));
                                    },
                                  ))
                            ],
                          );
                        },
                        childCount: categoryByProduct.length == null?0:categoryByProduct.length,
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
        ),
      ),
    );
  }
}
