// To parse this JSON data, do
//
//     final sectionDosModel = sectionDosModelFromJson(jsonString);

import 'dart:convert';

SectionDosModel sectionDosModelFromJson(String str) => SectionDosModel.fromJson(json.decode(str));

String sectionDosModelToJson(SectionDosModel data) => json.encode(data.toJson());

class SectionDosModel {
  SectionDosModel({
    required this.typeMenu,
  });

  List<TypeMenu> typeMenu;

  factory SectionDosModel.fromJson(Map<String, dynamic> json) => SectionDosModel(
    typeMenu: List<TypeMenu>.from(json["type_menu"].map((x) => TypeMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type_menu": List<dynamic>.from(typeMenu.map((x) => x.toJson())),
  };
}

class TypeMenu {
  TypeMenu({
    required this.menu,
    required this.type,
  });

  List<Menu> menu;
  String type;

  factory TypeMenu.fromJson(Map<String, dynamic> json) => TypeMenu(
    menu: (json.containsKey('menu')) ? List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))) : [],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
    "type": type,
  };
}

class Menu {
  Menu({
    required this.description,
    required this.img,
    required this.price,
    required this.title,
  });

  String description;
  String img;
  String price;
  String title;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    description: json["description"],
    img: json["img"],
    price: json["price"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "img": img,
    "price": price,
    "title": title,
  };
}


