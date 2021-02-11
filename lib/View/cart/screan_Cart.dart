import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            FutureBuilder(
              future: apiGetCart(macAddress: _MacAddress),
              builder: (context, snapshot) {
                return Button_CartAppBar(
                    context: context,
                    cartLength: getCart.length.toString() ?? "",
                    onTap: () {});
              },
            ),
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
        body: FutureBuilder(
          future: apiGetCart(macAddress: _MacAddress),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
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

                                onTap_increaseQuantity: () {
                                  setState(() {
                                    apiEditQuantity(
                                      product_order_id: product.id,
                                      type: "plus",
                                    );
                                  });
                                },

                                //===== Increase quantity ========================
                                onTap_decreaseQuantity: () {
                                  setState(() {
                                    apiEditQuantity(
                                      product_order_id: product.id,
                                      type: "minus",
                                    );
                                  });
                                },

                                //==== OnTap Delete  product From Cart ===================
                                onTap_DeleteProduct: () {
                                  setState(() {
                                    apiDeleteProduct(
                                        order_id: getDataCart?.info?.orderId,
                                        product_order_id: product.id);
                                  });
                                },
                              );
                            },
                            childCount:
                                getCart.length == null ? 0 : getCart.length,
                          )),

                          //============================== اجمالي الفاتورة / الدفع ======
                          Widget_checkPrice(),
                        ]);
            }
            return Text("0");
            // return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
