import 'package:Khaldiya/View/Home/HomeApp.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:Khaldiya/View/ToolsApp/WidgetApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 300,
        width: 300,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Image.asset("asset/Image/cart_empty.png"),
            my_Button(
                textButton: "تسوق الان",
                horizontal: 50,
                radiusButton: 10,
                colorButton: anGreen,
                fontSize: an.fontSize(),
                onTap: ()=> Get.to(HomeApp())
            )
          ],
        ),
      ),
    );
  }
}
