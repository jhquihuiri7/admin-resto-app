import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:flutter/material.dart';

class SectionDosProvider extends ChangeNotifier {

  late SectionDosModel _sectionDosModel;
  SectionDosModel get sectionDosModel => _sectionDosModel;
  set sectionDosModel(SectionDosModel value){
    _sectionDosModel = value;
  }

  SectionDosModel _sectionDosModelNew = SectionDosModel(typeMenu: []);
  SectionDosModel get sectionDosModelNew => _sectionDosModelNew;
  set sectionDosModelNew(SectionDosModel value){
    _sectionDosModelNew = value;
    notifyListeners();
  }
  int _sectionIndex = 0;
  int get sectionIndex => _sectionIndex;
  set sectionIndex(int value){
    _sectionIndex = value;
    notifyListeners();
  }
  Menu _menuItem = Menu(description: '', img: '', price: '', title: '');
  Menu get menuItem => _menuItem;
  set menuItem(Menu value){
    _menuItem = value;
    notifyListeners();
  }
  String _menuItemToDelete = '';
  String get menuItemToDelete => _menuItemToDelete;
  set menuItemToDelete(String value){
    _menuItemToDelete = value;
  }
}