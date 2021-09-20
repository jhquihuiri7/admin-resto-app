import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/contacto_form_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/dismissible_slider_widget.dart';
import 'package:admin_resto_app/src/widgets/load_logo_widget.dart';
import 'package:flutter/material.dart';
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
      'addSliderHeader': LoadLogoWidget(logo: 'addSliderHeader'),
    };
    return (pages.containsKey(utilsProvider.loadLogo))
        ? pages[utilsProvider.loadLogo]
        : Container();
  }

  NetworkImage logoImage(BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final modelProvider = Provider.of<ModelProvider>(context);
    String image = '';
    if (utilsProvider.loadLogo == 'logo'){
      image = modelProvider.logoNew;
    }else if (utilsProvider.loadLogo == 'logoFooter'){
      image = utilsProvider.logoFooterNew;
    }else if (utilsProvider.loadLogo == 'logoMenu'){
      image = utilsProvider.logoMenuNew;
    }else if (utilsProvider.loadLogo == 'addSliderHeader'){
      image = modelProvider.slideNew;
    }
    return NetworkImage(image);
  }

  void resetValues(BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    utilsProvider.loadLogo = '';
  }
}
