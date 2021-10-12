import 'package:flutter/material.dart';

class ConstraintProvider extends ChangeNotifier {

  int _screenType = 3;
  int get screenType => _screenType;
  set screenType (int value){
    _screenType = value;
  }

}