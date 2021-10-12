import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:flutter/material.dart';

class SectionDosProvider extends ChangeNotifier {

  late SectionDosModel _sectionDosModel;
  SectionDosModel get sectionDosModel => _sectionDosModel;
  set sectionDosModel(SectionDosModel value){
    _sectionDosModel = value;
  }


}