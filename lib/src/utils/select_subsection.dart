import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/contacto_form_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/dismissible_slider_widget.dart';
import 'package:admin_resto_app/src/widgets/fourth_section/map_widget.dart';
import 'package:admin_resto_app/src/widgets/load_logo_widget.dart';
import 'package:admin_resto_app/src/widgets/second_section/add_menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class SelectSubsection {
  Widget? selectSubsection (BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context);

    Map<String, Widget> pages = <String, Widget>{
      'logo': LoadLogoWidget(logo: 'logo'),
      'logoFooter': LoadLogoWidget(logo: 'logoFooter'),
      'logoMenu' : LoadLogoWidget(logo: 'logoMenu'),
      'contacto': ContactoFormWidget(),
      'sliderHeader':DismissibleSliderWidget(type: 'sliderHeader',),
      'sliderPromo':DismissibleSliderWidget(type: 'sliderPromo',),
      'addsliderHeader': LoadLogoWidget(logo: 'sliderHeader'),
      'addsliderPromo': LoadLogoWidget(logo: 'sliderPromo'),
      'sliderRestaurant': DismissibleSliderWidget(type: 'sliderRestaurant',),
      'sliderMoments': DismissibleSliderWidget(type: 'sliderMoments',),
      'map': MapWidget(),
      'addItem': LoadLogoWidget(logo: 'addItem'),
    };
    return (pages.containsKey(utilsProvider.loadLogo))
        ? pages[utilsProvider.loadLogo]
        : Container();
  }

  NetworkImage logoImage(BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final modelProvider = Provider.of<ModelProvider>(context);
    final sectionDosProvider = Provider.of<SectionDosProvider>(context);

    String image = '';
    if (utilsProvider.loadLogo == 'logo'){
      image = modelProvider.logoNew;
    }else if (utilsProvider.loadLogo == 'logoFooter'){
      image = utilsProvider.logoFooterNew;
    }else if (utilsProvider.loadLogo == 'logoMenu'){
      image = utilsProvider.logoMenuNew;
    }else if (utilsProvider.loadLogo.substring(3) == 'sliderHeader'){
      image = modelProvider.slideNew;
    }else if (utilsProvider.loadLogo.substring(3) == 'sliderPromo'){
      image = modelProvider.slideNew;
    }else if (utilsProvider.loadLogo == 'sliderRestaurant'){
      image = modelProvider.slideNew;
    }else if (utilsProvider.loadLogo == 'sliderMoments'){
      image = modelProvider.slideNew;
    }
    else if (utilsProvider.loadLogo == 'addItem'){
      image = sectionDosProvider.menuItem.img;
    }
    return NetworkImage(image);
  }

  void resetValues(BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    utilsProvider.loadLogo = '';
  }

  LatLng setLatLng(BuildContext context){
    final sectionCuatroProvider = Provider.of<SectionCuatroProvider>(context, listen: false);
    if (sectionCuatroProvider.latNew == '' && sectionCuatroProvider.lngNew == ''){
      if (sectionCuatroProvider.sectionCuatro.map.lat == ''){
        return LatLng(0,0);
      }else {
        return LatLng(
            double.parse(sectionCuatroProvider.sectionCuatro.map.lat),
            double.parse(sectionCuatroProvider.sectionCuatro.map.lng)
        );
      }
    }else {
      print('no vacio');
      return LatLng(
          double.parse(sectionCuatroProvider.latNew),
          double.parse(sectionCuatroProvider.lngNew)
      );
    }

  }

}
