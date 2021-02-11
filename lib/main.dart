import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'View/Home/HomeApp.dart';
import 'View/ToolsApp/StyleApp.dart';
import 'View/cart/screan_Cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Almarai",
        primaryColor:anGreen,
      ),


      home: HomeApp(),
      // home: getmac(),
     // home: screan_Cart(),
     // home: scren_MyOrder(statOrder: "Delivery",numberOrder: "122222",),
     // home: screan_profile(),
     // home: screan_Conditions(),
     // home: screan_DoneOrder(),

    );
  }
}
