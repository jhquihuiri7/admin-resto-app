import 'dart:math';

import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/backend/request_upload.dart';
import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';

class TypeMenuList extends StatefulWidget {

  @override
  _TypeMenuListState createState() => _TypeMenuListState();
}

class _TypeMenuListState extends State<TypeMenuList> {
  @override
  Widget build(BuildContext context) {
    final sectionDosProvider = Provider.of<SectionDosProvider>(context);
    int index = -1;
    List<Widget> typeMenu = [];
    List<TypeMenu> selectSectionDos(){
      if (sectionDosProvider.sectionDosModelNew.typeMenu.isEmpty){
        return sectionDosProvider.sectionDosModel.typeMenu;
      }else {
        return sectionDosProvider.sectionDosModelNew.typeMenu;
      }
    }
    selectSectionDos().forEach((element) {
      List<Widget> menu = [];
      index++;
      int indexMenu = index;
      element.menu.forEach((menuElement){
        Widget menuTemp = Dismissible(
            key: Key(menuElement.img),
            onDismissed: (direction) async{
              if (sectionDosProvider.sectionDosModelNew.typeMenu.isEmpty){
                sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModel;
              }
              sectionDosProvider.sectionDosModelNew.typeMenu.elementAt(indexMenu).menu.removeWhere((element) => element.img == menuElement.img);
              sectionDosProvider.menuItemToDelete = menuElement.img;
              await RequestUpload().deleteFile(context, 'deleteItemMenu');
              await RequestService().addSection(context);
            },
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
              ],
            )
        );
        menu.add(menuTemp);
      });
      menu.add(SizedBox(height: 10,));
      menu.add(Row(
        children: [
          Expanded(child: Container()),
          CommonWidgets().ElevatedButtonWidget(
              context: context,
              title: 'Eliminar sección',
              widget: 'delMenu',
              indexMenu: indexMenu
          ),
          SizedBox(width: 20),
          CommonWidgets().ElevatedButtonWidget(
              context: context,
              title: '+ Item',
              widget: 'addItem',
              indexMenu: indexMenu
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
    typeMenu.add(CommonWidgets().ElevatedButtonWidget(
        context: context,
        title: 'Agregar sección',
        widget: 'addMenu'
    ),);
    typeMenu.add(SizedBox(height: 20,));

    return Column(
      children: typeMenu,
    );
  }
}
