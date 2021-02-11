import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SlideProduct extends StatelessWidget {
  const SlideProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: an.heightQuery() * 0.35,
      width: an.widthQuery(),
      color: Colors.black12,
      child :CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: "${dataProduct?.productImagePath ?? ""}",
        placeholder: (context, url) => Image.asset("asset/Image/tenor.gif"),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}