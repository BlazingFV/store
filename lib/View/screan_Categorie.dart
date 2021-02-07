import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCateroyProduct.dart';
import 'package:Khaldiya/View/screan_Producte.dart';
import 'package:flutter/material.dart';
import 'CustomWidget/MyDrawer.dart';
import 'CustomWidget/Wid_product.dart';

class screan_Categorie extends StatefulWidget {
  final int id;
  final String imageCategorie, nameCategorie;
  const screan_Categorie(
      {Key key, this.id, this.imageCategorie, this.nameCategorie})
      : super(key: key);

  @override
  _screan_CategorieState createState() => _screan_CategorieState();
}

class _screan_CategorieState extends State<screan_Categorie> {


  @override
  Widget build(BuildContext context) {
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(


        //=================================drawer===============
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          // title: Text("${widget.nameCategorie}" , style: TextStyle(fontSize: heightQuery*0.022)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),

        //=================================drawer===============
        drawer: MyDrawer(),

        //=================================body===============
        body: FutureBuilder(
          future: apiProductCateroy(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  //----SliverList Widget-----------------
                  SliverList(
                      delegate: SliverChildListDelegate([
                    new Container(
                      // margin: EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${widget.imageCategorie}"))),
                      child: Center(
                          child: Text(
                        "${widget.nameCategorie}",
                        style: TextStyle(
                            fontSize: heightQuery * 0.030, color: Colors.white),
                      )),
                    ),
                  ])),

                  //---SliverGrid Product-----------------
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          DataCateroy producte = dataProductCateroy[index];
                          return Wid_product(
                            product: DataCateroy(
                              name: producte.name,
                              image: producte.image,
                              productPrice: producte.productPrice,
                              productRealPrice: producte.productRealPrice,
                            ),

                            onTapAddToCart: () {print("اضافة المنتج للسلة$index");},

                            onTapProducte: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)
                              => screan_Producte(id: producte.id,),));
                              },
                          );
                        },
                        childCount: dataProductCateroy.length == null ? 0 : dataProductCateroy.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 10)),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
