import 'package:flutter/material.dart';

import '../export_widget.dart';

class LogoInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget logoInfo (){
      return CommonWidgets().logoInfoForCard(context: context, logo: 'logo');
    }

    return CommonWidgets().CardWidgetBasic(widget: logoInfo());
  }
}
