import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../CustomWidget/MyDrawer.dart';
import '../ToolsApp/StyleApp.dart';
import '../ToolsApp/WidgetApp.dart';
import '../ToolsApp/scraen_MyOrder.dart';
import '../../FuncationApp.dart';


class screan_profile extends StatelessWidget {


  void _webURL(){
    _launch('https://ebaakw.com');
  }


  void _twitterURL(){
    _launch('https://twitter.com/Ebaa_kw');
  }

  void _facebookURL(){
    _launch('https://www.facebook.com/EBAA.kuwait');
  }

  void _instagramURL(){
    _launch('https://www.instagram.com/ebaa_kw/');
  }

  void _snapchatURL(){
    _launch('https://www.snapchat.com');
  }

  void _Telephone(){
    _launch("tel:00965 97524240");
  }

  void _launch(String urlString) async {
    if(await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }



  @override
  Widget build(BuildContext context) {

    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;

    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:anGreen,

        //=================================drawer===============
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),
          backgroundColor: anGreen,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.white),
                onPressed: (){Navigator.pop(context);})
          ],
        ),


        //=================================drawer===============
        drawer: MyDrawer(),



         body: Center(
           child: Column(
             children: <Widget>[
               
               new Container(
                 height: 100,
                 padding: EdgeInsets.only(top: 0),
                 width: MediaQuery.of(context).size.width,
                 child: Column(
                   children: <Widget>[

                     SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: new Text("مرحباً بك في تطبيق الخالدية للحضار والفواكة",
                         style: TextStyle(fontSize:fontsize,color: Colors.white,height: 1.4),textAlign: TextAlign.center,),
                     ),
                   ],
                 ),
               ),
               
               new Expanded(child:Container(
                 decoration: BoxDecoration(
                   color: anWhite,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(30),topRight: Radius.circular(30)
                   ),
                 ),
                 child:ListView(
                   shrinkWrap: true,
                   physics: BouncingScrollPhysics(),
                   children: <Widget>[

                    new SizedBox(height: 30),

                     new ListTile(
                       title: Text("مراجعة الطلب",style:TextStyle(fontSize:fontsize)),
                       leading: Icon(Icons.shop,color:anBlack,),
                       trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>
                         scren_MyOrder(statOrder: "Delivery",numberOrder: "33242",)));
                         },
                      ),


                     new ListTile(
                       title: Text("مشاركة التطبيق",style:TextStyle(fontSize: fontsize)),
                       onTap: (){shareData(context);},
                       leading: Icon(Icons.share,color:anBlack,),
                       trailing: Icon(Icons.arrow_forward_ios,size: 18,)
                     ),


                     new ListTile(
                       title: Text("مواعيد العمل",style:TextStyle(fontSize:fontsize)),
                       onTap: (){},
                       leading: Icon(Icons.access_time,color:anBlack,),
                       trailing: Icon(Icons.arrow_forward_ios,size: 18,)
                     ),


                     new ListTile(
                         title: Text("اللغة",style:TextStyle(fontSize: fontsize)),
                         onTap: (){},
                         leading: Icon(Icons.language,color:anBlack,),
                         trailing:Text("انجليزي",style:TextStyle(fontSize:fontsize),),
                     ),



                     new SizedBox(height: 100),


                     new Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[

                         InkWell(onTap: (){_facebookURL();},
                             child: new Image.asset("asset/Image/facebook.png",width: 40)
                         ),

                         SizedBox(width: 10),
                         InkWell(onTap: (){_twitterURL();},
                             child: new Image.asset("asset/Image/twitter.png",width: 40)
                         ),

                         SizedBox(width: 10),
                         InkWell(onTap: (){_snapchatURL();},
                             child: new Image.asset("asset/Image/snapchat.png",width: 40)
                         ),

                         SizedBox(width: 10),
                         InkWell(onTap: (){_instagramURL();},
                             child: new Image.asset("asset/Image/instagram.png",width: 40)
                         ),

                       ],
                     ),

                     SizedBox(height: 20),
                     my_ButtonIcon(
                       horizontal: 50,
                       textButton: "تحدث مع خدمة العملاء",
                       icon: Icons.phone_in_talk,
                       fontSize: fontsize-1,
                       radiusButton: 10,
                       colorButton: anGreen,
                       onPressed: (){_Telephone();}
                     ),



                     Padding(
                       padding: const EdgeInsets.only(bottom: 30,top: 5),
                       child: InkWell(
                         onTap: (){_webURL();},
                         child: Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: new Text("تصميم وبرمجة شركة EBAA للبرمجيات",
                             style: TextStyle(fontSize:fontsize-1),textAlign: TextAlign.center,),
                         ),
                       ),
                     ),


                   ],
                 )
               ))


             ],
           ),
         ),

      ),
    );
  }
}
