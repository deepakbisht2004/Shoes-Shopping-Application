import 'package:flutter/material.dart';


class Cartprovider extends ChangeNotifier{
  final List<Map<String, Object>> cart  =   [];


  void additem(Map<String, Object>product){
    cart.add(product);
    notifyListeners();

  }
  void Remove(Map<String, Object>product){
    cart.remove(product);
    notifyListeners();
  }
}