import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:flutter/material.dart';
import '../ToolsApp/WidgetApp.dart';


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


Widget EmptyCart({double fontsize ,Function onTap}){
  return Align(alignment: Alignment.center,
    child: Container(
      height: 300,
      width: 300,
      color: Colors.white,
      child: Column(
        children:<Widget>[
          new Image.asset("asset/Image/cart_empty.png"),
          my_Button(
            textButton: "تسوق الان",
            horizontal: 50,
            radiusButton:10,
            colorButton: anGreen,
            fontSize:fontsize,
            onTap:onTap
          )
        ],
      ),
    ),
  );
}



Widget buildRow({String name , price, Color color, BuildContext context}){
  var orientation = MediaQuery.of(context).orientation;
  double heightQuery = MediaQuery.of(context).size.height;
  double widthQuery = MediaQuery.of(context).size.width;
  double fontsize = orientation==Orientation.portrait ? heightQuery*0.020 :widthQuery * 0.020 ;
  double sizeButton = orientation==Orientation.portrait ? heightQuery*0.06 :widthQuery * 0.06 ;

  return new Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 10,bottom: 13),
        child: new Text("$name",style:TextStyle(fontSize: fontsize,color: color)),
      ),
      new Text("$price",style:TextStyle(fontFamily: "BebasNeue",fontSize:fontsize,color: color)),
    ],
  );
}
