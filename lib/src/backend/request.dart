import 'dart:async';

import 'package:admin_resto_app/src/models/section_cuatro_model.dart';
import 'package:admin_resto_app/src/providers/auth_provider.dart';
import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/providers/section_tres_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class RequestService {
  String baseUrl = 'admin-resto-app-default-rtdb.firebaseio.com';
  Future<dynamic> loadData (BuildContext context) async {
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final Uri url = Uri.https(baseUrl, '/$restaurant.json');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    return decodedData;
  }
  Future replaceMap (BuildContext context) async{
    final sectionCuatroProvider = Provider.of<SectionCuatroProvider>(context, listen: false);
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final Uri url = Uri.https(baseUrl, '$restaurant/section_4/map.json');
    final newMap = MapClass(lat: '${sectionCuatroProvider.latNew}', lng: '${sectionCuatroProvider.lngNew}');
    await http.put(url, body: json.encode(newMap.toJson()));
  }
  Future replaceLogo(BuildContext context, String logo) async {
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final Uri url = Uri.https(baseUrl, '$restaurant/logo.json');
    await http.put(url, body: json.encode(logo));
  }
  Future replaceFooter(BuildContext context) async {
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final Uri url = Uri.https(baseUrl, '$restaurant/footer.json');
    await http.put(url, body: json.encode(utilsProvider.footerModel.toMap()));
  }
  Future replaceMenuPhoto(BuildContext context) async {
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final Uri url = Uri.https(baseUrl, '$restaurant/section_1/.json');
    Map<String, dynamic> logoMenu = {'menu_photo':utilsProvider.logoMenuNew};
    await http.patch(url, body: json.encode(logoMenu));
  }
  Future removeSlider (BuildContext context, String type) async {
   final modelProvider = Provider.of<ModelProvider>(context, listen: false);
   final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
   final sectionTresProvider = Provider.of<SectionTresProvider>(context, listen: false);
   final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
   String slide = '';
   if (type == 'sliderHeader'){
     slide = 'slide_header';
   }else if (type == 'sliderPromo'){
     slide = 'section_1/slide_promo';
   }else if (type == 'sliderRestaurant'){
     slide = 'section_3/restaurant';
   }else if (type == 'sliderMoments'){
     slide = 'section_3/moments';
   }
   final Uri url = Uri.https(baseUrl, '$restaurant/$slide.json');
   if (type == 'sliderHeader'){
     await http.put(url, body: json.encode(modelProvider.slideHeaderNew.map((e) => e.toMap()).toList()));
   }else if (type == 'sliderPromo'){
     await http.put(url, body: json.encode(utilsProvider.slidePromoNew.map((e) => e.toMap()).toList()));
   }else if (type == 'sliderRestaurant'){
     await http.put(url, body: json.encode(sectionTresProvider.slideRestaurantNew.map((e) => e.toMap()).toList()));
   }else if (type == 'sliderMoments'){
     await http.put(url, body: json.encode(sectionTresProvider.slideMomentsNew.map((e) => e.toMap()).toList()));
   }
  }
  Future addSlider (BuildContext context, String type) async {
    final modelProvider = Provider.of<ModelProvider>(context, listen: false);
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    String slide = '';
    if (type == 'sliderHeader'){
      slide = 'slide_header';
    }else if (type == 'sliderPromo'){
      slide = 'section_1/slide_promo';
    }
    final Uri url = Uri.https(baseUrl, '$restaurant/$slide.json');
    if (type == 'sliderHeader'){
      await http.put(url, body: json.encode(modelProvider.slideHeaderNew.map((e) => e.toMap()).toList()));
    }else if (type == 'sliderPromo'){
      await http.put(url, body: json.encode(utilsProvider.slidePromoNew.map((e) => e.toMap()).toList()));
    }
  }
  Future addSection (BuildContext context) async{
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final sectionDosProvider = Provider.of<SectionDosProvider>(context, listen: false);
    final Uri url = Uri.https(baseUrl, '$restaurant/section_2/type_menu.json');
    await http.put(url, body: json.encode(sectionDosProvider.sectionDosModelNew.typeMenu.map((e) => e.toJson()).toList()));
  }
  Future deleteSection (BuildContext context) async {
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    final sectionDosProvider = Provider.of<SectionDosProvider>(context, listen: false);
    if (sectionDosProvider.sectionDosModelNew.typeMenu.isEmpty){
      sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModel;
    }
    sectionDosProvider.sectionDosModelNew.typeMenu.removeAt(sectionDosProvider.sectionIndex);
    sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModelNew;
    final Uri url = Uri.https(baseUrl, '$restaurant/section_2/type_menu.json');
    await http.put(url, body: json.encode(sectionDosProvider.sectionDosModelNew.typeMenu.map((e) => e.toJson()).toList()));
  }
  Future deleteItemMenu (BuildContext context) async {

  }

}