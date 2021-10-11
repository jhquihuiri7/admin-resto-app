import 'package:flutter_login/flutter_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomLoginTheme {

  LoginTheme loginTheme (BuildContext context){
    LoginTheme _loginTheme = LoginTheme(
      primaryColor: Theme.of(context).accentColor,
      errorColor: Colors.deepOrange,
      titleStyle: GoogleFonts.cabin(
          textStyle: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Theme.of(context).primaryColorLight,
          )),
    );
    return _loginTheme;
  }
}
