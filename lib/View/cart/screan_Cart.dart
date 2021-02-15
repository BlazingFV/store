import 'dart:async';

import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Control/control_Cart.dart';
import 'package:Khaldiya/Model/ModelCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_mac/get_mac.dart';
import '../ToolsApp/StyleApp.dart';
import '../CustomWidget/MyDrawer.dart';
import 'Wid_ProducteCart.dart';
import '../CustomWidget/WidgetApp.dart';
import 'EmptyCart.dart';
import 'WidgetPrice.dart';

class screan_Cart extends StatefulWidget {
  @override
  _screan_CartState createState() => _screan_CartState();
}

class _screan_CartState extends State<screan_Cart> {
  final control_Cart _control = Get.put(control_Cart());
  int selectedRadio;
  String _MacAddress = 'Unknown';

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    fun_GetMacAddress();
  }

  Future<void> fun_GetMacAddress() async {
    String macAddress;
    try {
      macAddress = await GetMac.macAddress;
    } on PlatformException {
      macAddress = 'Failed to get Device MAC Address.';
    }
    print("MAC-: " + macAddress);
    if (!mounted) return;
    setState(() {
      _MacAddress = macAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        //=====AppBar==========================================================
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: an.text("سلة المشتريات", color: Colors.white),
          actions: <Widget>[
            Obx(() => Button_CartAppBar(
                context: context, cartLength: _control.conteCrt, onTap: null)),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),

        //=======MyDrawer======================================================
        drawer: MyDrawer(),

        //=======MyDrawer======================================================
        body: Obx(() => _control.loading.value
            ? Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: apiGetCart(macAddress: _MacAddress),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    // return Center(child: CircularProgressIndicator());
                    return Center();
                  }
                  return getCart.isEmpty
                      ? EmptyCart()
                      : CustomScrollView(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          slivers: <Widget>[
                              //============================= منتجات السلة  =============
                              SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  MProduct product = getCart[index];
                                  return Wid_ProducteCart(
                                    Product: MProduct(
                                      price: product.price,
                                      image: product.image,
                                      name: product.name,
                                      qty: product.qty,
                                    ),

                                    //============increaseQuantity===================
                                    onTap_increaseQuantity: () {
                                      apiEditQuantity(
                                        product_order_id: product.id,
                                        type: "plus",
                                      );
                                      Timer.periodic(
                                          Duration(milliseconds: 500), (timer) {
                                        _control.fetchCart();
                                        timer.cancel();
                                      });
                                    },

                                    //===== decreaseQuantity ========================
                                    onTap_decreaseQuantity: () {
                                      apiEditQuantity(
                                        product_order_id: product.id,
                                        type: "minus",
                                      );
                                      Timer.periodic(
                                          Duration(milliseconds: 500), (timer) {
                                        _control.fetchCart();
                                        timer.cancel();
                                      });
                                    },

                                    //==== OnTap Delete  product From Cart ===================
                                    onTap_DeleteProduct: () {
                                      apiDeleteProduct(
                                          order_id: getDataCart?.info?.orderId,
                                          product_order_id: product.id);

                                      Timer.periodic(
                                          Duration(milliseconds: 500), (timer) {
                                        _control.fetchCart();
                                        timer.cancel();
                                      });
                                    },
                                  );
                                },
                                childCount: _control.conteCrt == null
                                    ? 0
                                    : _control.conteCrt,
                              )),

                              //============================== اجمالي الفاتورة / الدفع ======
                              Widget_checkPrice(),
                            ]);
                },
              )));
  }
}
