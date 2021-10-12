import 'package:admin_resto_app/src/widgets/common/common_widgets.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/second_section/type_menu_list.dart';
import 'package:flutter/material.dart';

class SectionDosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget menuWidget(){
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            TitleTheme().titleTheme('Sección Dos',2),
            SizedBox(height: 10,),
            TypeMenuList(),
            SizedBox(height: 10,),
          ]
      );
    }
    return ListView(
      children: [
        SizedBox(height: 15,),
        CommonWidgets().ContainerWidget(widget: menuWidget()),
      ],
    );
  }
}
