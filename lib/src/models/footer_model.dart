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
  Redes redes;

  factory FooterModel.fromJson(String str) => FooterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FooterModel.fromMap(Map<String, dynamic> json) => FooterModel(
    contacto: Contacto.fromMap(json["contacto"]),
    logoFooter: json["logo_footer"],
    redes: Redes.fromMap(json["redes"]),
  );

  Map<String, dynamic> toMap() => {
    "contacto": contacto.toMap(),
    "logo_footer": logoFooter,
    "redes": redes.toMap(),
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
    required this.facebook,
    required this.instagram,
  });

  String facebook;
  String instagram;

  factory Redes.fromJson(String str) => Redes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Redes.fromMap(Map<String, dynamic> json) => Redes(
    facebook: json["facebook"],
    instagram: json["instagram"],
  );

  Map<String, dynamic> toMap() => {
    "facebook": facebook,
    "instagram": instagram,
  };
}
