import 'package:admin_resto_app/src/models/section_cuatro_model.dart';
import 'package:flutter/material.dart';

class SectionCuatroProvider extends ChangeNotifier {

  late SectionCuatroModel _sectionCuatro;
  SectionCuatroModel get sectionCuatro => _sectionCuatro;
  set sectionCuatro (SectionCuatroModel value){
    _sectionCuatro = value;
  }
  String _latNew = '';
  String _lngNew = '';
  String get lngNew => _lngNew;
  String get latNew => _latNew;
  set lngNew (String value){
    _lngNew = value;
    notifyListeners();
  }
  set latNew (String value){
    _latNew = value;
    notifyListeners();
  }

  int _mapId = 0;
  int get mapId => _mapId;
  set mapId (int value){
    _mapId = value;
    notifyListeners();
  }
}