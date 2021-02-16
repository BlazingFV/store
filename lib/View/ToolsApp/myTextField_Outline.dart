import 'dart:core';
import 'dart:core';
import 'package:flutter/material.dart';
import '../ToolsApp/StyleApp.dart';

class myTextField_Outline extends StatelessWidget {
  final String hint;
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Function onClick;
  final Color colorfill;
  final Color colorborder;
  final int maxLines;
  final IconData suffixIcon;
  final Function onTapSuffixIcon;
  final bool filled;
  final double borderRadius;

  myTextField_Outline(
      {this.onTapSuffixIcon,
      this.suffixIcon,
      this.borderRadius,
      this.maxLines,
      this.filled,
      this.colorfill,
      this.colorborder,
      this.onClick,
      this.textInputType,
      this.textInputAction,
      this.hint,
      this.controller,
      this.labelText,
      this.prefixIcon,
      this.obscureText});

  String _errorMessage(String srt) {
    switch (labelText){
      case "المحافظة":
        return "اختار المحافظة";
        break;

      case "المنطقة":
        return "اختار المنطقة";
        break;

      case "رقم القطعة":
        return "قم بادخال رقم القطعة";
        break;

      case "رقم الشارع":
        return "قم بادخال رقم الشارع";
        break;


      case "رقم المنزل":
        return "قم بادخال رقم المنزل";
        break;


      case "الاسم":
        return "قم بادخال الاسم";
        break;

      case "رقم الهاتف":
        return "قم بادخال رقم الهاتف";
        break;

      case "القطعة":
        return "قم بادخال رقم القطعة";
        break;

      case "الشارع":
        return "قم بادخال الشارع";
        break;

      case "جادة":
        return "قم بادخال رقم جادة";
        break;

      case "منزل":
        return "قم بادخال رقم المنزل";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.019 :widthQuery * 0.019 ;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: TextFormField(

        validator: (value) {if (value.isEmpty) return _errorMessage(labelText);},
        onSaved: onClick,
        controller: controller,
        obscureText: obscureText == null ? obscureText == false : obscureText == true,

        //لون الايقونة
        cursorColor: Colors.black,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines,

        decoration: InputDecoration(
            suffixIcon: suffixIcon==null ? null: IconButton(
              icon:Icon(suffixIcon), onPressed: onTapSuffixIcon,
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: fontsize),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: fontsize),
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            filled: filled == null ? false : true,
            fillColor: colorfill == null ? colorfill : colorfill,


            //========في حالة الظهور العادي=======================
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
              color: colorborder == null ?
              Colors.grey : colorborder, width: 0.5),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),

            //============في حالة الطغط تظهر هذا التاثيرات
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),

            //========في حالة اظهار خطاء=======================
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),

            //========في حالة الضغط اظهار خطاء=======================
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),
            errorStyle: TextStyle(color: Colors.red)),
      ),
    );
  }
}
