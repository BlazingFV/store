import 'dart:ui';

import 'package:Khaldiya/Model/ModelCategories.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../ToolsApp/StyleApp.dart';

class Wid_Catogry extends StatelessWidget {
  final Function onTap;
  final DataCategories categories;
  const Wid_Catogry({Key key, this.onTap, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: <Widget>[



            Center(
                child: Text(
              "${categories.name}",
              style: TextStyle(color: Colors.black, fontSize: an.fontSize()),
            )),


          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(width:1, color: Colors.green.shade900),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage("${categories.image}"))
        ),
      ),
    );
  }
}
