import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:flutter/material.dart';

class SectionTresProvider extends ChangeNotifier {
  List<SlidePromo> _slideRestaurant = [];
  List<SlidePromo> get slideRestaurant => _slideRestaurant;
  set slideRestaurant (List<SlidePromo> value){
    _slideRestaurant = value;
  }

  List<SlidePromo> _slideRestaurantNew = [];
  List<SlidePromo> get slideRestaurantNew => _slideRestaurantNew;
  set slideRestaurantNew (List<SlidePromo> value){
    _slideRestaurantNew = value;
    notifyListeners();
  }

  List<SlidePromo> _slideMoments = [];
  List<SlidePromo> get slideMoments => _slideMoments;
  set slideMoments (List<SlidePromo> value){
    _slideMoments = value;
  }
  List<SlidePromo> _slideMomentsNew = [];
  List<SlidePromo> get slideMomentsNew => _slideMomentsNew;
  set slideMomentsNew (List<SlidePromo> value){
    _slideMomentsNew = value;
    notifyListeners();
  }


}