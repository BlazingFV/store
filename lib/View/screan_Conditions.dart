import 'package:flutter/material.dart';
import 'CustomWidget/MyDrawer.dart';
import 'ToolsApp/StyleApp.dart';


class screan_Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;

    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(



        //=================================drawer===============
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("الشروط والاحكام",style: TextStyle(fontSize:fontsize),),
          iconTheme: new IconThemeData(color: Colors.white),
          backgroundColor: anGreen,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.white),
                onPressed: (){Navigator.pop(context);})
          ],
        ),


        //=================================drawer===============
        drawer: MyDrawer(),


        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: new Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،"
                  " لقد تم توليد هذا النص من مولد النص العربى،"
                  " حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة ..."
                ,style: TextStyle(fontSize:fontsize-3,height: 1.5),),
            )
          ],
        ),


      ),
    );
  }
}
