// To parse this JSON data, do
//
//     final sectionUno = sectionUnoFromJson(jsonString);

import 'dart:convert';

SectionUnoModel sectionUnoFromJson(String str) => SectionUnoModel.fromJson(json.decode(str));

String sectionUnoToJson(SectionUnoModel data) => json.encode(data.toJson());

class SectionUnoModel {
  SectionUnoModel({
    required this.slidePromo,
  });

  List<SlidePromo> slidePromo;

  factory SectionUnoModel.fromJson(Map<String, dynamic> json) => SectionUnoModel(
    slidePromo: List<SlidePromo>.from(json["slide_promo"].map((x) => SlidePromo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "slide_promo": List<dynamic>.from(slidePromo.map((x) => x.toJson())),
  };
}

class SlidePromo {
  SlidePromo({
    required this.img,
  });

  String img;

  factory SlidePromo.fromJson(Map<String, dynamic> json) => SlidePromo(
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
  };
}
