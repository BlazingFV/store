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
                            fontSize: an.fontSize()-5, color: Colors.grey[900]),
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
                                      fontSize: an.fontSize()+3,
                                      fontFamily: "BebasNeue",
                                      color: Colors.grey,
                                      decoration:TextDecoration.lineThrough),
                                ),
                              ],
                            ),

                            new Row(
                              children: <Widget>[
                                new Text("KD ", style: TextStyle(fontSize: an.fontSize()-4),
                                ),
                                new Text(
                                  "${product.productRealPrice}", style: TextStyle(fontSize: an.fontSize()+4, fontFamily: "BebasNeue"),
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
