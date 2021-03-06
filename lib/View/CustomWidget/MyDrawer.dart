import 'dart:io';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../FuncationApp.dart';
import '../Home/HomeApp.dart';
import '../profile/scraen_profile.dart';
import '../Conditions/screan_Conditions.dart';

class MyDrawer extends StatelessWidget {

  void _playgoogle(){
    _launch('https://play.google.com/store/apps/details?id=com.facebook.orca');
  }

  void _applestor(){
    _launch('https://apps.apple.com/us/app/messenger/id454638411');
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

    return Drawer(
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[

          new ListTile(
            onTap:(){
              Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeApp(),));

              },
            title:Text("الرئيسية",style: TextStyle(fontSize:an.fontSize()),),
            leading: Icon(Icons.home,size: 35,color: Colors.black,),
          ),



          new ListTile(
            onTap:(){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => screan_profile(),));
              },
            title:Text("حسابي",style: TextStyle(fontSize: an.fontSize()),),
            leading: Image.asset("asset/Image/logooffer.png",scale:3.5),
          ),



          new ListTile(
            onTap:(){

            },
            title:Text("مواعيد العمل",style: TextStyle(fontSize: an.fontSize()),),
            leading: Icon(Icons.timer,color:Colors.black,size: 35,),
          ),

          new ListTile(
            onTap:(){
              shareData(context);
            },
            title:Text("مشاركة التطبيق",style: TextStyle(fontSize: an.fontSize()),),
            leading: Image.asset("asset/Image/shaer.png",scale:5.2),
          ),

          new ListTile(
            onTap:(){
              if(Platform.isIOS){
                _applestor();
              }else if(Platform.isAndroid){
                _playgoogle();
              }
            },
            title:Text("تقييم التطبيق",style: TextStyle(fontSize: an.fontSize()),),
            leading: Icon(Icons.star,color: Colors.amber,size: 33),
          ),

          new ListTile(
            onTap:(){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => screan_Conditions()));},
            title:Text("الشروط والاحكام",style: TextStyle(fontSize: an.fontSize()),),
            leading: Image.asset("asset/Image/logofile.png",scale:4.5),
          ),


        ],
      ),
    );
  }
}
