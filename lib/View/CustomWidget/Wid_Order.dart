
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:flutter/material.dart';

class Wid_Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: anGreen,width: 0.5)
      ),
      child: Row(
        children: <Widget>[

          //=========================بيانات الطلب ===============
          new Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _nameValue(name: "رقم الطلب : ",value: "1234453"),
                  _nameValue(name: "تاريخ الطلب : ",value: "12-10-2020"),
                  _nameValue(name: "نوع الدفع : ",value: "كاش"),
                  _nameValue(name: "اجمالي الفاتورة : ",value: "123 د.ك"),
                ],
              )
          ),


          //=========================مراحل توصيل الطلب ===============
          new Row(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(minRadius: 13,child: Icon(Icons.done,size: 19,)),
                      CircleAvatar(minRadius: 13,child: Icon(Icons.done,size: 19,)),
                      CircleAvatar(minRadius: 13,child: Icon(Icons.done,size: 19,)),
                    ],
                  ),
                ],
              ),


              new SizedBox(width: 10),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text("قيد التوصيل ",style: TextStyle(fontSize: 17),),
                  new Text("خدمة التوصيل",style: TextStyle(fontSize: 17),),
                  new Text("تم التسليم",style: TextStyle(fontSize: 17),),
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}


Widget _nameValue({String name , value}) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: new Row(
      children: <Widget>[
        new Text("$name",style: TextStyle(fontSize: 15)),
        new Text("$value",style: TextStyle(fontSize: 17)),
      ],
    ),
  );
}
