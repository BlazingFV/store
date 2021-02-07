import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext context;
const anWhite = const Color(0xFFFFFFFF);
const anBlack = const Color(0xFF000000);
const anAmber = const Color(0xFFFFCA08);
const anGreen = const Color(0xFF18A02F);
const ananwer = const Color(0xFFFFF8DC);
const anBGAPP = const Color(0xFFFAFAFA);

const fontstyleStatOrder = TextStyle(
  fontSize: 20,
  color: Colors.black,
);
const fontstyleprofile = TextStyle(
  fontSize: 19,
  color: Colors.black,
);

class an {
  static Color anLoding = const Color(0xFFF1F2F3);

  static String getDeviceLang() => Get.locale.languageCode;

  //============= font Size Responsive ===========
  static fontSize() {
    var orientation = MediaQuery.of(Get.context).orientation;
    double heightQuery = MediaQuery.of(Get.context).size.height;
    double widthQuery = MediaQuery.of(Get.context).size.width;
    return orientation == Orientation.portrait
        ? heightQuery * 0.022
        : widthQuery * 0.022;
  }

  //============= Widget Text =======================
  static text(String text,
      {double size,
      double height,
      Color color,
      String family,
      FontWeight fontWeight,
      TextAlign textAlign,
      Function onTap,
      TextDecoration decoration}) {
    return InkWell(
      onTap: onTap == null ? null : onTap,
      child: Text("$text",
          textAlign: textAlign == null ? TextAlign.center : textAlign,
          style: TextStyle(
              fontSize: size == null ? fontSize() : size,
              color: color == null ? Colors.white : color,
              fontFamily: family,
              height: height,
              fontWeight: fontWeight,
              decoration: decoration)),
    );
  }

  //============= width MediaQuery =======================
  static widthQuery() => MediaQuery.of(Get.context).size.width;

  //============= height MediaQuery =======================
  static heightQuery() => MediaQuery.of(Get.context).size.height;
}
