import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/View/screan_Cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import './ToolsApp/StyleApp.dart';
import 'CustomWidget/Wid_bottomNavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';

class screan_Producte extends StatefulWidget {
  final int id;
  const screan_Producte({Key key, this.id}) : super(key: key);

  @override
  _screan_ProducteState createState() => _screan_ProducteState();
}

class _screan_ProducteState extends State<screan_Producte> {
  int quantity = 1;
  num pricePerOne;
  String _MacAddress = 'Unknown';



  void increaseQuantity() {
    quantity++;
    setState(() {});
  }

  void decreaseQuantity() {
    if (quantity != 1) quantity--;
    setState(() {});
  }

  num get totalPrice => quantity * pricePerOne;

  Future apiproduct;
  @override
  void initState() {
    super.initState();
    apiproduct = _apiproductd();
    fun_GetMacAddress();
  }

  _apiproductd() async {
    return await apiproductDetails(id: widget.id);
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),

      //====== bottomNavigationBar =========================================
      bottomNavigationBar: Wid_bottomNavigationBar(
        numberLCart: "",
        onTapCart: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screan_Cart(),
              ));
        },
        onTapAddToCart: () {
          apiAddCart(
            mac_address: _MacAddress,
            price: totalPrice,
            productId: widget.id,
            quantity: quantity,
          );
        },
      ),

      //====== bottomNavigationBar =========================================
      body: FutureBuilder(
        future: apiproduct,
        builder: (context, snapshot) {
          pricePerOne =
              double.parse(dataProduct?.productRealPrice ?? "0.000");

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //======Slide image Producte ==================
                    new Container(
                      height: heightQuery * 0.35,
                      width: widthQuery,
                      color: Colors.black12,

                      child :CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: "${dataProduct?.productImagePath ?? ""}",
                        placeholder: (context, url) => Image.asset("asset/Image/tenor.gif"),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),

                      // child: FadeInImage(
                      //     fit: BoxFit.fill,
                      //     placeholder: AssetImage("asset/Image/tenor.gif"),
                      //     image: NetworkImage(
                      //         "${dataProduct?.productImagePath ?? ""}")),

                    ),

                    new Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.shade400,
                    ),

                    new SizedBox(height: 15),

                    //======== name product ============
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: new Text(
                        "${dataProduct?.productArName ?? ""}",
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ),

                    //======== Product Description ============
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: new Text("${dataProduct?.productArDesc ?? ""}",
                          style: TextStyle(
                              fontSize: fontsize - 4, height: 1.5)),
                    ),

                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: new Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 0),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: this.increaseQuantity,
                                  child: new CircleAvatar(
                                      backgroundColor: anGreen,
                                      maxRadius: 17,
                                      child:
                                      Icon(Icons.add, color: anWhite)),
                                ),
                                SizedBox(width: 20),
                                new Text(quantity.toString(),
                                    style: TextStyle(
                                        fontSize: fontsize + 2,
                                        fontFamily: "")),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: decreaseQuantity,
                                  child: new CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      maxRadius: 17,
                                      child: Icon(Icons.remove,
                                          color: Colors.black)),
                                ),
                              ],
                            ),

                            //======== Product price ============
                            new Row(
                              children: <Widget>[
                                new Text(totalPrice.toStringAsFixed(3),
                                    style: TextStyle(
                                        fontSize: fontsize + 3,
                                        fontFamily: "BebasNeue")),
                                new Text("د.ك",
                                    style: TextStyle(
                                        fontSize: fontsize - 4,
                                        fontFamily: "Almarai")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
