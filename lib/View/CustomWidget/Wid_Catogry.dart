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

    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3,vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: <Widget>[
            new CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: "${categories.image}",
              placeholder: (context, url) => Image.asset("asset/Image/tenor.gif"),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Center(child: Text("${categories.name}",style: TextStyle(color: Colors.black,fontSize:fontsize),)),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(width:1, color: Colors.green.shade900)
        ),
      ),
    );
  }
}
