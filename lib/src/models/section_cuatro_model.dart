// To parse this JSON data, do
//
//     final sectionCuatroModel = sectionCuatroModelFromJson(jsonString);

import 'dart:convert';

SectionCuatroModel sectionCuatroModelFromJson(String str) => SectionCuatroModel.fromJson(json.decode(str));

String sectionCuatroModelToJson(SectionCuatroModel data) => json.encode(data.toJson());

class SectionCuatroModel {
  SectionCuatroModel({
    required this.map,
  });

  MapClass map;

  factory SectionCuatroModel.fromJson(Map<String, dynamic> json) => SectionCuatroModel(
    map: MapClass.fromJson(json["map"]),
  );

  Map<String, dynamic> toJson() => {
    "map": map.toJson(),
  };
}

class MapClass {
  MapClass({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory MapClass.fromJson(Map<String, dynamic> json) => MapClass(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}
