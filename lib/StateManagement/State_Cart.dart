import 'package:Khaldiya/LocalData/Data_productes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class State_Cart extends ChangeNotifier{

  List<Data_productes> _items =[];
  double _totlePrice = 0.0;


  //==================================== اضافة كمية علي المنتج =======
  void addNumber(Data_productes item){
    if(item.requiredQuantity<1)
    {
      item.requiredQuantity ++;
    }
    notifyListeners();
  }


  //=================================== تنقص من كمية المنتج  ========
  void removNumber(Data_productes item){
    if(item.requiredQuantity>1)
    {
      item.requiredQuantity --;
    }
    notifyListeners();
  }



  void add(Data_productes item){
    _items.add(item);
    _totlePrice += item.price;
    notifyListeners();
  }


  void remove(Data_productes item){
    _totlePrice -=item.price;
    _items.remove(item);
    notifyListeners();
  }

  void removeAll(){
    _items.clear();
    _totlePrice =0.0;
    notifyListeners();
  }




  int get count{
    return _items.length;
  }

  double get totlePrice{
    return _totlePrice;
  }

  List<Data_productes> get cartItems{
    return _items;
  }





}