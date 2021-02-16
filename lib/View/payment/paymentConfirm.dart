import 'package:Khaldiya/View/ToolsApp/myTextField_Under.dart';
import 'package:Khaldiya/View/DoneOrder/screan_DoneOrder.dart';
import 'package:flutter/material.dart';
import '../ToolsApp/WidgetApp.dart';
import '../ToolsApp/StyleApp.dart';
import '../ToolsApp/myTextField_Outline.dart';

class paymentConfirm extends StatefulWidget {
  @override
  _paymentConfirmState createState() => _paymentConfirmState();
}

class _paymentConfirmState extends State<paymentConfirm> {
  String _email, _phone, _password, _name, _katha, _gada, _home, _phoneHome;
  String _payment = "كي نت";
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  int selectedRadio;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation == Orientation.portrait
        ? heightQuery * 0.022
        : widthQuery * 0.022;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //=================================drawer===============
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: anBGAPP,
          leading: Text(""),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: anBlack),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),

        body: Form(
          key: globalKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: heightQuery * 0.00),
              myTextField_Outline(
                labelText: "الاسم",
                textInputType: TextInputType.text,
                borderRadius: 10,
                onClick: (value) {
                  _name = value;
                },
              ),
              SizedBox(height: heightQuery * 0.02),
              myTextField_Outline(
                labelText: "رقم الهاتف",
                textInputType: TextInputType.phone,
                borderRadius: 10,
                onClick: (value) {
                  _phone = value;
                },
              ),
              SizedBox(height: heightQuery * 0.02),
              myTextField_Outline(
                labelText: "القطعة",
                textInputType: TextInputType.number,
                borderRadius: 10,
                onClick: (value) {
                  _katha = value;
                },
              ),
              SizedBox(height: heightQuery * 0.02),
              myTextField_Outline(
                labelText: "الشارع",
                textInputType: TextInputType.number,
                borderRadius: 10,
              ),
              SizedBox(height: heightQuery * 0.02),
              myTextField_Outline(
                labelText: "جادة",
                textInputType: TextInputType.number,
                borderRadius: 10,
              ),
              SizedBox(height: heightQuery * 0.02),
              myTextField_Outline(
                labelText: "منزل",
                textInputType: TextInputType.number,
                borderRadius: 10,
              ),
              SizedBox(height: heightQuery * 0.02),
              myTextField_Outline(
                labelText: "تليفون المنزل",
                textInputType: TextInputType.number,
                borderRadius: 10,
              ),
              SizedBox(height: heightQuery * 0.02),
              new RadioListTile(
                dense: true,
                activeColor: anGreen,
                title: Text(
                  "كي نت",
                  style: TextStyle(fontSize: fontsize, height: 1),
                ),
                value: 0,
                groupValue: selectedRadio,
                onChanged: (val) {
                  setState(() {
                    _payment = "كي نت";
                    print("$_payment");
                    setSelectedRadio(val);
                  });
                },
              ),
              new RadioListTile(
                dense: true,
                activeColor: anGreen,
                title: Text(
                  "الدفع عن الاستلام",
                  style: TextStyle(fontSize: fontsize, height: 1),
                ),
                value: 1,
                groupValue: selectedRadio,
                onChanged: (val) {
                  setState(() {
                    _payment = "الاستلام";
                    print("$_payment");
                    setSelectedRadio(val);
                  });
                },
              ),
              new SizedBox(height: heightQuery * 0.02),
              my_Button(
                textButton: "تاكيد الدفع",
                heightButton: 60,
                horizontal: 10,
                colorButton: anGreen,
                colorText: anWhite,
                radiusButton: 10,
                fontSize: fontsize,
                onTap: () {
                  if (_payment == "كي نت") {
                    if (globalKey.currentState.validate()) {
                      globalKey.currentState.save();
                      print(_name);
                    }
                  } else {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screan_DoneOrder(),
                        ));
                  }
                },
              ),
              new SizedBox(height: heightQuery * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
