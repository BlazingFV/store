import 'package:Khaldiya/View/CustomWidget/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'StyleApp.dart';

class scren_MyOrder extends StatefulWidget {
  final String numberOrder,statOrder;
  const scren_MyOrder({Key key, this.numberOrder, this.statOrder}) : super(key: key);

  @override
  _scren_MyOrderState createState() => _scren_MyOrderState();
}

class _scren_MyOrderState extends State<scren_MyOrder> {

  bool _accepted;
  bool _Delivery;
  bool _complete;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch(widget.statOrder){

      case "StatEmpty" :
        _accepted = false;
        _Delivery = false;
        _complete = false;
        break;


      case "accepted" :
        _accepted = true;
        _Delivery = false;
        _complete = false;
        break;


      case "Delivery" :
        _accepted = true;
        _Delivery = true;
        _complete = false;
        break;

      case "complete" :
        _accepted = true;
        _Delivery = true;
        _complete = true;
        break;

      default :
        _accepted = false;
        _Delivery = false;
        _complete = false;
    }
  }


  @override
  Widget build(BuildContext context) {

    var orientation = MediaQuery.of(context).orientation;
    double heightQuery = MediaQuery.of(context).size.height;
    double widthQuery = MediaQuery.of(context).size.width;
    double fontsize = orientation==Orientation.portrait ? heightQuery*0.022 :widthQuery * 0.022 ;
    double fontsizeStat = orientation==Orientation.portrait ? heightQuery*0.018 :widthQuery * 0.018 ;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,

          //=================================drawer===============
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text("مراجعة الطلب",style: TextStyle(fontSize:fontsize)),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){Navigator.pop(context);})
            ],
          ),


          //=================================drawer===============
          drawer: MyDrawer(),

          body:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: heightQuery*0.03),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: new Text("رقم الطلب : ${widget.numberOrder}",style: TextStyle(fontSize:fontsize),),
                ),

                SizedBox(height: heightQuery*0.01),
                new Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: anGreen,width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      new Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: <Widget>[



                          CircleAvatar(
                          backgroundColor: _accepted ? Colors.green : Colors.grey, maxRadius: 14,
                              child: Icon(Icons.done, size: 20, color: Colors.white)
                          ),



                          CircleAvatar(
                          backgroundColor: _Delivery ? Colors.green : Colors.grey, maxRadius: 14,
                              child: Icon(Icons.done, size: 20, color: Colors.white)
                          ),



                          CircleAvatar(
                          backgroundColor: _complete ? Colors.green : Colors.grey, maxRadius: 14,
                              child: Icon(Icons.done, size: 20, color: Colors.white)
                          ),



                        ],
                      ),

                      new Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text("قيد التجهيذ ",style: TextStyle(fontSize:fontsizeStat),),
                          new Text("قيد التوصيل",style: TextStyle(fontSize: fontsizeStat),),
                          new Text("تم التوصيل",style: TextStyle(fontSize: fontsizeStat),),
                        ],
                      ),


                    ],
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}


