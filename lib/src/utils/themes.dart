import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTheme {

  Widget titleTheme (String text,int type){
    int size = 25;
    FontWeight fontWeight = FontWeight.w700;
    Color color = Colors.black;
    if (type == 2){
      size = 17;
      fontWeight = FontWeight.w600;
    }
    if (type == 3){
      size = 15;
      fontWeight = FontWeight.w600;
      color = Colors.white;
    }
    TextStyle textStyle = TextStyle(fontSize: size.toDouble(), fontWeight: fontWeight, color: color);
    return Text(text,
        style: (type == 1)
        ?GoogleFonts.cabin(
            textStyle: textStyle)
        :textStyle);
  }
}
class TilesTheme {
  TextStyle tilesTheme(){
    return TextStyle(fontSize: 14);
  }
}

