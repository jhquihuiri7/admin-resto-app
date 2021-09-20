import 'package:admin_resto_app/src/models/section_uno_model.dart';
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

  List<SlidePromo> _slideHeader = [];
  List<SlidePromo> get slideHeader => _slideHeader;
  set slideHeader (List<SlidePromo> value){
    _slideHeader = value;
  }
  List<SlidePromo> _slideHeaderNew = [];
  List<SlidePromo> get slideHeaderNew => _slideHeaderNew;
  set slideHeaderNew (List<SlidePromo> value){
    _slideHeaderNew = value;
    notifyListeners();
  }

  SlidePromo _slideToDelete = SlidePromo(img: '');
  SlidePromo get slideToDelete => _slideToDelete;
  set slideToDelete (SlidePromo value){
    _slideToDelete = value;
    notifyListeners();
  }

  String _slideNew = '';
  String get slideNew => _slideNew;
  set slideNew (String value){
    _slideNew = value;
    notifyListeners();
  }
}