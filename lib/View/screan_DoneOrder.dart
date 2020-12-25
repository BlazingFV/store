import 'package:flutter/material.dart';
import 'HomeApp.dart';
import 'ToolsApp/StyleApp.dart';
import 'ToolsApp/WidgetApp.dart';

class screan_DoneOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;

    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(

        bottomNavigationBar: SizedBox(
          height: 70,
          child: my_ButtonIcon(
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeApp(),));},
            textButton: "العودة للصفحة للرئيسية",
            fontSize:fontsize,
            icon: Icons.home,
            colorButton: anGreen
          ),
        ),
        

        body: ListView(
          children: <Widget>[
            new SizedBox(height: heightQuery *0.1),
            new CircleAvatar(
              minRadius: 60,
              backgroundColor:anGreen,
              child: Icon(Icons.done,size: 70,color: anWhite,),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 40),
              child: new Text("تم تنفيذ الطلب بنجاح",style: TextStyle(fontSize:fontsize),textAlign: TextAlign.center),
            ),


            new Container(
              height: 250,
              width: widthQuery,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: anGreen,width: 0.4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildRow(context: context,name: "رقم الطلب" , value: "1234242"),
                    new Divider(),
                  _buildRow(context: context,name: "تاريخ الطلب" , value: "12-10-2020"),
                    new Divider(),
                  _buildRow(context: context,name: "طريقة الدفع" , value: "كاش"),
                   new Divider(),
                  _buildRow(context: context,name: "اجمالي الفاتورة" , value: "12.450 kd"),

                ],
              ),
            ),

          ],
        ),


      ),
    );
  }

  Widget _buildRow({String name, value,BuildContext context}){
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("$name: ",style: TextStyle(fontSize: fontsize-1),textAlign: TextAlign.start,),
          SizedBox(width:5),
          new Text("$value",style: TextStyle(fontSize: fontsize-1),),
        ],
      ),
    );
  }
}
