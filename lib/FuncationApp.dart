import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';


//==================Share Data to anthoer App ===================
  String textBody = "حمل تطبيق الجابرية للخضار والفواكة وتمتع بافضل العروض والخصومات";
  String textIOS = "Iphone";
  String linkIOS = "https://pub.dev/packages/share/install";
  String textAndroid = "Android";
  String linkAndroid  = "https://pub.dev/packages/share/install";
  shareData(BuildContext context){
    final RenderBox box = context.findRenderObject();
    Share.share(
        "$textBody $textIOS $linkIOS $textAndroid $linkAndroid",
        sharePositionOrigin:box.localToGlobal(Offset.zero)&box.size
    );
  }


