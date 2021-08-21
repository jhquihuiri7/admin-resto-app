// To parse this JSON data, do
//
//     final footer = footerFromMap(jsonString);

import 'dart:convert';

class FooterModel {
  FooterModel({
    required this.contacto,
    required this.logoFooter,
    required this.redes,
  });

  Contacto contacto;
  String logoFooter;
  List<Redes> redes;

  factory FooterModel.fromJson(String str) => FooterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FooterModel.fromMap(Map<String, dynamic> json) => FooterModel(
    contacto: Contacto.fromMap(json["contacto"]),
    logoFooter: json["logo_footer"],
    redes: List<Redes>.from(json["redes"].map((x) => Redes.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "contacto": contacto.toMap(),
    "logo_footer": logoFooter,
    "redes": List<dynamic>.from(redes.map((x) => x.toMap())),
  };
}

class Contacto {
  Contacto({
    required this.direccion,
    required this.mail,
    required this.telefono,
  });

  String direccion;
  String mail;
  String telefono;

  factory Contacto.fromJson(String str) => Contacto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contacto.fromMap(Map<String, dynamic> json) => Contacto(
    direccion: json["direccion"],
    mail: json["mail"],
    telefono: json["telefono"],
  );

  Map<String, dynamic> toMap() => {
    "direccion": direccion,
    "mail": mail,
    "telefono": telefono,
  };
}

class Redes {
  Redes({
    required this.red,
    required this.url,
  });

  String red;
  String url;

  factory Redes.fromJson(String str) => Redes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Redes.fromMap(Map<String, dynamic> json) => Redes(
    red: json["red"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "red": red,
    "url": url,
  };
}
