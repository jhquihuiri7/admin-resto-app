import 'dart:math';

import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';

class TypeMenuList extends StatefulWidget {

  @override
  _TypeMenuListState createState() => _TypeMenuListState();
}

class _TypeMenuListState extends State<TypeMenuList> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    final sectionDosProvider = Provider.of<SectionDosProvider>(context);

    List<Widget> typeMenu = [];
    sectionDosProvider.sectionDosModel.typeMenu.forEach((element) {
      List<Widget> menu = [];
      element.menu.forEach((menuElement){
        Widget menuTemp = Dismissible(
            key: Key(menuElement.img),
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: ExpansionTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                image: NetworkImage(menuElement.img),
              ),
            ),
          ),
          title: Text(menuElement.title),
          subtitle: Text(menuElement.price),
          children: <Widget>[
            Text(menuElement.description),
            SizedBox(height: 10,),
            CommonWidgets().ElevatedButtonWidget(
              context: context,
              title: 'Editar',
              widget: 'gj',
            ),
            SizedBox(height: 10,),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ));
        menu.add(menuTemp);
      });
      menu.add(SizedBox(height: 10,));
      menu.add(Row(
        children: [
          Expanded(child: Container()),
          CommonWidgets().ElevatedButtonWidget(
              context: context,
              title: '+',
              widget: 'add'
          ),
          SizedBox(width: 20,)
        ],
      ));
      Widget widgetTemp =  CommonWidgets().CardWidgetLabeled(
          context: context,
          widget: Column(
            children: menu,
          ),
          label: Text(element.type),
          beginSizedBox: true,
          endSizedBox: true);
      typeMenu.add(widgetTemp);
      typeMenu.add(SizedBox(height: 20,));
    });

    return Column(
      children: typeMenu,
    );
  }
}
