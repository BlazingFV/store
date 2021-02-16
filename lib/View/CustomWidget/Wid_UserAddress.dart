import 'package:flutter/material.dart';
import '../ToolsApp/WidgetApp.dart';
import '../ToolsApp/StyleApp.dart';

class Wid_UserAddress extends StatelessWidget {
  final String userAddress;
  final Function onTapChangeaddress;
  const Wid_UserAddress({Key key, this.userAddress, this.onTapChangeaddress}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      decoration: BoxDecoration(
          color: ananwer,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: anGreen,width: 0.4)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              new Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  new Text("عنوان التوصيل ",style: TextStyle(fontSize: 20,color: anGreen),)
                ],
              ),

              my_Button(
                  textButton: "تغيير العنوان",
                  heightButton: 20,
                  radiusButton: 10,
                  colorButton: anGreen,
                  onTap:onTapChangeaddress
              )

            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: new Text("$userAddress",style:TextStyle(fontSize: 16),),
          ),

        ],
      ),
    );
  }
}
