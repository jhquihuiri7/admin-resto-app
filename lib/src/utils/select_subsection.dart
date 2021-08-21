import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/widgets/load_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SelectSubsection {
  Widget? selectSubsection (BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    Map<String, Widget> pages = <String, Widget>{
      'logo': LoadLogoWidget(),
    };
    return (pages.containsKey(utilsProvider.loadLogo))
        ? pages[utilsProvider.loadLogo]
        : Container();
  }
  void resetValues(BuildContext context){
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    utilsProvider.loadLogo = '';
  }
}
