import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class RequestService {
  String baseUrl = 'admin-resto-app-default-rtdb.firebaseio.com';
  Future<dynamic> loadData (BuildContext context) async {
    final Uri url = Uri.https(baseUrl, '/la_sazon.json');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    return decodedData;
  }
  Future replaceLogo(BuildContext context, String logo) async {
    final Uri url = Uri.https(baseUrl, 'la_sazon/logo.json');
    await http.put(url, body: json.encode(logo));
  }
  Future replaceFooter(BuildContext context) async {
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final Uri url = Uri.https(baseUrl, 'la_sazon/footer.json');
    await http.put(url, body: json.encode(utilsProvider.footerModel.toMap()));
  }
  Future replaceMenuPhoto(BuildContext context) async {
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final Uri url = Uri.https(baseUrl, 'la_sazon/section_1/.json');
    Map<String, dynamic> logoMenu = {'menu_photo':utilsProvider.logoMenuNew};
    await http.patch(url, body: json.encode(logoMenu));
  }
  Future removeSlider (BuildContext context, String type) async {
   final modelProvider = Provider.of<ModelProvider>(context, listen: false);
   final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
   String slide = '';
   if (type == 'sliderHeader'){
     slide = 'slide_header';
   }else if (type == 'sliderPromo'){
     slide = 'section_1/slide_promo';
   }
   final Uri url = Uri.https(baseUrl, 'la_sazon/$slide.json');
   if (type == 'sliderHeader'){
     await http.put(url, body: json.encode(modelProvider.slideHeaderNew.map((e) => e.toMap()).toList()));
   }else if (type == 'sliderPromo'){
     await http.put(url, body: json.encode(utilsProvider.slidePromoNew.map((e) => e.toMap()).toList()));
   }
  }
  Future addSlider (BuildContext context, String type) async {
    final modelProvider = Provider.of<ModelProvider>(context, listen: false);
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    String slide = '';
    if (type == 'sliderHeader'){
      slide = 'slide_header';
    }else if (type == 'sliderPromo'){
      slide = 'section_1/slide_promo';
      print('Prmo');
    }
    final Uri url = Uri.https(baseUrl, 'la_sazon/$slide.json');
    if (type == 'sliderHeader'){
      await http.put(url, body: json.encode(modelProvider.slideHeaderNew.map((e) => e.toMap()).toList()));
    }else if (type == 'sliderPromo'){
      await http.put(url, body: json.encode(utilsProvider.slidePromoNew.map((e) => e.toMap()).toList()));
    }
  }
}