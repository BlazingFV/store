import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/View/ToolsApp/StyleApp.dart';
import 'package:Khaldiya/View/ToolsApp/WidgetApp.dart';
import 'package:Khaldiya/View/payment/paymentConfirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Widget_checkPrice extends StatelessWidget {
  const Widget_checkPrice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            buildRow(
                context: context,
                name: "المجموع",
                price: "${getDataCart?.totalPrice ?? ""}",
                color: Colors.grey[500]),
            buildRow(
                context: context,
                name: "رسوم التوصيل",
                price: "${getDataCart?.totaShippingCost ?? ""}",
                color: Colors.grey[500]),
            buildRow(
                context: context,
                name: "اجمالي افاتورة",
                price: "${getDataCart?.total ?? ""}"),
          ],
        ),
      ),
      my_Button(
        horizontal: 10,
        heightButton: 60,
        textButton: "دفع",
        fontSize: an.fontSize(),
        colorButton: anGreen,
        radiusButton: 10,
        onTap: () {
          Get.to(paymentConfirm());
        },
      ),
      SizedBox(height: 30)
    ]));
  }
}

Widget buildRow({String name, price, Color color, BuildContext context}) {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 13),
        child: new Text("$name",
            style: TextStyle(fontSize: an.fontSize(), color: color)),
      ),
      new Text("$price",
          style: TextStyle(
              fontFamily: "BebasNeue", fontSize: an.fontSize(), color: color)),
    ],
  );
}
