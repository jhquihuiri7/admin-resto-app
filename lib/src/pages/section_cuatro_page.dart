import 'package:admin_resto_app/src/pages/map.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as mapWeb;

class SectionCuatroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget mapWidget(){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          TitleTheme().titleTheme('Sección Cuatro',2),
          SizedBox(height: 10,),
          CommonWidgets().CardWidgetLabeled(
              context: context,
              widget: MapWidget(),
              label: Text('Mapa'),
              beginSizedBox: false,
              endSizedBox: true),
        ]
      );
    }
    return ListView(
      children: [
        SizedBox(height: 15,),
        CommonWidgets().ContainerWidget(widget: mapWidget()),
      ],
    );
  }
}
