import 'package:flutter/cupertino.dart';

class ModelProvider  extends ChangeNotifier {
  String _logo = '';
  String get logo => _logo;
  set logo (String value){
    _logo = value;
  }

  String _logoNew = '';
  String get logoNew => _logoNew;
  set logoNew (String value){
    _logoNew = value;
    notifyListeners();
  }
}