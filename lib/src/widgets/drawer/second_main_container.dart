import 'package:admin_resto_app/src/widgets/drawer/list_tile_main_widget.dart';
import 'package:flutter/material.dart';

class SecondMainContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: 250,
      height: size.height * 0.57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xfff3f7fa),
      ),
      child: Column(
        children: generateListTile()
      ),
    );
  }
}

final List<Map<String,dynamic>> list = [
  {'title':'Seccion 1', 'icon': Icons.workspaces_filled},
  {'title':'Seccion 2', 'icon': Icons.restaurant},
  {'title':'Seccion 3', 'icon': Icons.photo},
  {'title':'Seccion 4', 'icon': Icons.contact_mail_sharp},
  {'title':'Soporte', 'icon': Icons.support_agent},
  {'title':'Cerrar Sesion', 'icon': Icons.logout},
];
List<Widget> generateListTile(){
 List<Widget> listTiles = [];
  for (int i = 0 ; i < list.length ; i++){
    final Widget widgetTemp = ListTileMainWidget(
      title: list[i]['title'],
      icon: list[i]['icon'],
      index: i,);
    listTiles.add(widgetTemp);
    if (i == 3){
      listTiles.add(Expanded(child: Container()));
    }
  }
  return listTiles;
}