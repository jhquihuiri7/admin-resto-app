import 'package:admin_resto_app/src/pages/section_cuatro_page.dart';
import 'package:admin_resto_app/src/pages/section_dos_page.dart';
import 'package:admin_resto_app/src/pages/section_tres_page.dart';
import 'package:admin_resto_app/src/pages/section_uno_page.dart';
import 'package:admin_resto_app/src/providers/auth_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectSection {
  Widget? selectSection (BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    Map<String, Widget> pages = <String, Widget>{
      '0':SectionUnoPage(),
      '1':SectionDosPage(),
      '2':SectionTresPage(),
      '3':SectionCuatroPage(),
    };
    return (pages.containsKey(utilsProvider.mainIndex.toString()))
        ? pages[utilsProvider.mainIndex.toString()]
        : Container();
  }

  launchWhatsApp(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final link = WhatsAppUnilink(
      phoneNumber: '+593982291894',
      text: "Estimados Logiciel Applab, los contactamos de parte de la empresa ${authProvider.restaurantName} debido a que tenemos ciertos inconvenientes con:",
    );

    await launch('$link');
  }
}