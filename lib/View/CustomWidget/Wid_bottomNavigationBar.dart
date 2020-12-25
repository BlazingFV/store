import 'package:flutter/material.dart';
import '../ToolsApp/StyleApp.dart';
import '../ToolsApp/WidgetApp.dart';

class Wid_bottomNavigationBar extends StatelessWidget{
  final Function onTapAddToCart;
  final Function onTapCart;
  final String numberLCart;
  const Wid_bottomNavigationBar({Key key, this.onTapAddToCart, this.onTapCart, this.numberLCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;

    return Container(
      height: 80,
      padding: EdgeInsets.only(bottom: 25,right: 20,left: 20),
      child: Row(
        children: <Widget>[

          new Expanded(flex: 3,
              child:SizedBox(height: 60,
                  child: my_Button(
                      radiusButton: 5,
                      onTap:onTapAddToCart,
                      colorButton: anGreen,
                      fontSize: fontsize+2,
                      textButton: "اضافة للسلة"
                  )
              )),

          new SizedBox(width: 10),

          GestureDetector(onTap:onTapCart,
            child: new Container(
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: anGreen)
              ),
              child: Stack(
                children: <Widget>[
                  Center(child: Image.asset("asset/Image/logocart.png",width: 45)),


                  Positioned(
                      top: 5,right:10,
                      child: new CircleAvatar(backgroundColor: anBlack,maxRadius: 12,
                          child: Text("$numberLCart",style: TextStyle(color:anWhite),))
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
