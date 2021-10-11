import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _restaurantPath = '';
  String _restaurantName = '';

  String get restaurantPath => _restaurantPath;
  set restaurantPath (String value){
    _restaurantPath = value;
    notifyListeners();
  }

  String get restaurantName => _restaurantName;
  set restaurantName (String value) {
    _restaurantName = value;
    notifyListeners();
  }
}