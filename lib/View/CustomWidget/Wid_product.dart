import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
import 'package:flutter/material.dart';
import '../ToolsApp/StyleApp.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Wid_product extends StatelessWidget {
  final Function onTapAddToCart, onTapProducte;
  final DataCateroy product;

  const Wid_product({
    Key key, this.onTapAddToCart,
    this.onTapProducte,
    this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation == Orientation.portrait
        ? heightQuery * 0.022
        : widthQuery * 0.022;
    double fontsizeName = orientation == Orientation.portrait
        ? heightQuery * 0.018
        : widthQuery * 0.018;
    double fontsizePrice = orientation == Orientation.portrait
        ? heightQuery * 0.025
        : widthQuery * 0.025;
    String nameProduct = "${product.name}";

    return GestureDetector(
      onTap: onTapProducte,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.3, color: Colors.green)),
        child: Column(
          children: <Widget>[

            new Expanded(
                flex: 6,
                child: CachedNetworkImage(
                  fit:BoxFit.cover,
                  imageUrl: "${product.image}",
                  placeholder: (context, url) => Image.asset("asset/Image/tenor.gif"),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
            ),

            new Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //======================اسم المنتج ============
                      new Text(
                        "$nameProduct".length >= 50
                            ? nameProduct.substring(0, 50) + "..."
                            : nameProduct,
                        style: TextStyle(
                            fontSize: fontsizeName, color: Colors.grey[900]),
                        textAlign: TextAlign.center,
                      ),

                      //--------------------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "${product.productPrice == "0.000" ? "" :product.productPrice }",
                                  style: TextStyle(
                                      fontSize: fontsizeName+3,
                                      fontFamily: "BebasNeue",
                                      color: Colors.grey,
                                      decoration:TextDecoration.lineThrough),
                                ),
                              ],
                            ),

                            new Row(
                              children: <Widget>[
                                new Text("KD ", style: TextStyle(fontSize: fontsizeName),
                                ),
                                new Text(
                                  "${product.productRealPrice}", style: TextStyle(fontSize: fontsizePrice, fontFamily: "BebasNeue"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
