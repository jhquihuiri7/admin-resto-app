// To parse this JSON data, do
//
//     final sectionUno = sectionUnoFromJson(jsonString);

import 'dart:convert';

class SectionUnoModel {
  SectionUnoModel({
    required this.menuPhoto,
    required this.menuText,
    required this.slidePromo,
  });

  String menuPhoto;
  String menuText;
  List<SlidePromo> slidePromo;

  factory SectionUnoModel.fromJson(String str) => SectionUnoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SectionUnoModel.fromMap(Map<String, dynamic> json) => SectionUnoModel(
    menuPhoto: json["menu_photo"],
    menuText: json["menu_text"],
    slidePromo: List<SlidePromo>.from(json["slide_promo"].map((x) => SlidePromo.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "menu_photo": menuPhoto,
    "menu_text": menuText,
    "slide_promo": List<dynamic>.from(slidePromo.map((x) => x.toMap())),
  };
}

class SlidePromo {
  SlidePromo({
    required this.img,
  });

  String img;

  factory SlidePromo.fromJson(String str) => SlidePromo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SlidePromo.fromMap(Map<String, dynamic> json) => SlidePromo(
    img: json["img"],
  );

  Map<String, dynamic> toMap() => {
    "img": img,
  };
}
