import 'package:Khaldiya/Model/ModelCart.dart';
import 'package:Khaldiya/View/ToolsApp/WidgetApp.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../ToolsApp/StyleApp.dart';
import 'package:get/get.dart';

import 'Dialog_DeleteProduct.dart';

class Wid_ProducteCart extends StatelessWidget {
  final Function onTap_increaseQuantity, onTap_decreaseQuantity, onTap_DeleteProduct;
  final MProduct Product;

  const Wid_ProducteCart(
      {Key key,
      this.onTap_increaseQuantity,
      this.onTap_decreaseQuantity,
      this.onTap_DeleteProduct,
      this.Product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15, top: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      child: Row(
        children: <Widget>[
          //=========== Image Product =================
          new Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.green.shade900)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: "${Product.image}",
              placeholder: (context, url) =>
                  Image.asset("asset/Image/tenor.gif"),
              errorWidget: (context, url, error) => Icon(null),
            ),
          ),

          SizedBox(width: 10),
          new Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //============== اسم المنتج======
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: new Text("${Product.name}",
                    style: TextStyle(fontSize: an.fontSize() - 3)),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      //====== onTap increase Quantity ===============================================
                      GestureDetector(
                        onTap: onTap_increaseQuantity,
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      //=== String value  Quantity  ==================================================
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: new Text(
                          "${Product.qty}",
                          style: TextStyle(
                              fontFamily: "BebasNeue", fontSize: an.fontSize()),
                        ),
                      ),

                      //========= onTap decrease Quantity ============================================
                      GestureDetector(
                        onTap: onTap_decreaseQuantity,
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),

                  new Row(
                    children: <Widget>[
                      // new Text("${Product.price}",style: TextStyle(fontSize: an.fontSize(),fontFamily: "BebasNeue")),
                      an.text("${Product.price}",
                          family: "BebasNeue", size: an.fontSize() + 5),
                      SizedBox(width: 3),
                      new Text("K.D",
                          style: TextStyle(fontSize: an.fontSize())),
                    ],
                  ),

                  //============= حذف المنتج من السلة
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        Dialog_DeleteProduct(Product:Product,onTapDelete: onTap_DeleteProduct);
                      },
                      child: Image.asset(
                        "asset/Image/delete.png",
                        scale: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
