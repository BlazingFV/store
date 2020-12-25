import'package:flutter/material.dart';
import 'StateManagement/State_Cart.dart';
import 'package:provider/provider.dart';
import 'View/HomeApp.dart';
import 'View/ToolsApp/StyleApp.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<State_Cart>(create: (context) =>  State_Cart(),)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
