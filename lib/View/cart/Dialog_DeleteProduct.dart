import 'package:Khaldiya/Model/ModelCart.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:Khaldiya/View/ToolsApp/WidgetApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future Dialog_DeleteProduct({MProduct Product , Function onTapDelete}){
  return Get.defaultDialog(
      title: "هل تريد حذف المنتج",
      titleStyle: TextStyle(fontSize: an.fontSize(), color: Colors.redAccent),
      content: Container(
        child: Column(
          children: <Widget>[
            new Divider(),
            an.text("${Product.name}", size: an.fontSize()),
            new SizedBox(height: 10),
            an.text("${Product.price} k.d", size: an.fontSize() + 5),
            new SizedBox(height: 20),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                my_Button(
                    radiusButton: 10,
                    textButton: "نعم",
                    colorButton: Colors.redAccent,
                    fontSize: an.fontSize(),
                    onTap:onTapDelete
                    ),
                new SizedBox(width: 10),
                my_Button(
                    radiusButton: 10,
                    textButton: "لا",
                    colorButton: anGreen,
                    fontSize: an.fontSize(),
                    onTap: () {
                      Get.back();
                    })
              ],
            ),
          ],
        ),
      ));
}
