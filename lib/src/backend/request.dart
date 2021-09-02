import 'package:admin_resto_app/src/models/footer_model.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
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


}