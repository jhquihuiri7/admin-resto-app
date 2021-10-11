import 'package:admin_resto_app/src/auth/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class AuthenticationService {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _apiKey = 'AIzaSyB3vjV9sLh3ykZ-fQjmeYA_4aQERDTUi94';

  Future<String> signIn(String email, String password, BuildContext context) async{
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
      'key': _apiKey,
    });
    final resp = await http.post(url, body: json.encode(authData));
    final decodedResp = json.decode(resp.body);
    if (decodedResp['idToken'] == null){
      return 'Usuario o Contraseña no registrados';
    }else {
      LocalStorage.prefs.setString('idToken', decodedResp['idToken']);
      return '';
    }
  }
  Future<String> ressetPassword(String email, BuildContext context) async{
    final Map<String, dynamic> authData = {
      'email': email,
      'requestType': 'PASSWORD_RESET',
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:sendOobCode',{
      'key': _apiKey,
    });
    final resp = await http.post(url, body: json.encode(authData));
    final decodedResp = json.decode(resp.body);
    if (decodedResp['email'] == null){
      return 'Email no registrado';
    }else{
      return '';
    }

  }
}