import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:flutter/material.dart';


Widget Button_CartAppBar({BuildContext context,Function onTap ,String cartLength}) {
  return GestureDetector(
    onTap:onTap,
    child: new Container(
      width: 60,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:10),
            child: Center(child: Image.asset("asset/Image/logocart.png",width: 38)),
          ),
          Positioned(
              top: 7,left:35,
              child: new CircleAvatar(backgroundColor: anBlack,maxRadius: 12,
                  child: Text("$cartLength",style: TextStyle(color:anWhite),))
          ),
        ],
      ),
    ),
  );
}


Expanded Expanded_MainCategories({Function onTap,String image}) {
  return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("$image"))
            ),
          )
      ));
}
