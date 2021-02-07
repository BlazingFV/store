import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCart.dart';
import 'package:Khaldiya/View/paymentConfirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import './ToolsApp/StyleApp.dart';
import './ToolsApp/WidgetApp.dart';
import 'CustomWidget/MyDrawer.dart';
import 'CustomWidget/Wid_ProducteCart.dart';
import 'CustomWidget/WidgetApp.dart';

class screan_Cart extends StatefulWidget {
  @override
  _screan_CartState createState() => _screan_CartState();
}

class _screan_CartState extends State<screan_Cart> {
  double _TotlePrice = 0.0;
  int selectedRadio;
  String _MacAddress = 'Unknown';

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    fun_GetMacAddress();
    print(_MacAddress);
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
    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation == Orientation.portrait
        ? heightQuery * 0.022
        : widthQuery * 0.022;
    double sizeButton = orientation == Orientation.portrait
        ? heightQuery * 0.06
        : widthQuery * 0.06;

    return Scaffold(
        backgroundColor: Colors.white,

        //=====AppBar==========================================================
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            " سلة المشتريات ",
            style: TextStyle(fontSize: fontsize),
          ),
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
        body: FutureBuilder(
          future: apiGetCart(macAddress: _MacAddress),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return getCart.isEmpty
                  ? EmptyCart(
                      fontsize: fontsize,
                      onTap: () {
                        print("object");
                      })
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
                          SliverList(
                              delegate: SliverChildListDelegate([
                            new Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                // border: Border.all(width: 0.5,color: Colors.grey),
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
                                      price:
                                          "${getDataCart?.totaShippingCost ?? ""}",
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
                              fontSize: fontsize,
                              colorButton: anGreen,
                              radiusButton: 10,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => paymentConfirm(),
                                    ));
                              },
                            ),
                            SizedBox(height: 30)
                          ])),
                        ]);
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
