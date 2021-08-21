import 'package:admin_resto_app/src/models/footer_model.dart';
import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:flutter/cupertino.dart';

class UtilsProvider extends ChangeNotifier {
  int _mainIndex = 100;
  int get mainIndex => _mainIndex;
  set mainIndex (int value){
    _mainIndex = value;
    notifyListeners();
  }

  String _loadLogo = '';
  String get loadLogo => _loadLogo;
  set loadLogo (String value){
    _loadLogo = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading (bool value){
    _isLoading = value;
    notifyListeners();
  }

  late FooterModel _footerModel;
  FooterModel get footerModel => _footerModel;
  set footerModel (FooterModel value){
    _footerModel = value;
  }

  late SectionUnoModel _sectionUnoModel;
  SectionUnoModel get sectionUnoModel => _sectionUnoModel;
  set sectionUnoModel (SectionUnoModel value){
    _sectionUnoModel = value;
  }
}