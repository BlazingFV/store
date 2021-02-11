import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Wid_slideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      height: 180,
      child:Carousel(
        boxFit: BoxFit.cover,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 8,
        dotIncreasedColor:anGreen,
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.topRight,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        images: [
          NetworkImage("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/shopping-bag-full-of-fresh-vegetables-and-fruits-royalty-free-image-1128687123-1564523576.jpg"),
          NetworkImage("https://www.addafter.net/wp-content/uploads/2019/08/18538870_303.jpg"),
          NetworkImage("https://i1.wp.com/www.q8doc.com/wp-content/uploads/2018/08/43805cc8-2319-4adf-a2db-ed8e892a35e2-1.jpg?fit=750%2C498&ssl=1"),
        ],
      ),
    );

  }
}
