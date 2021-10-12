import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/fourth_section/latlong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SectionCuatroPage extends StatefulWidget {
  @override
  _SectionCuatroPageState createState() => _SectionCuatroPageState();
}

class _SectionCuatroPageState extends State<SectionCuatroPage> {
  TextEditingController controllerLat = TextEditingController();
  TextEditingController controllerLng = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sectionCuatroProvider = Provider.of<SectionCuatroProvider>(context);
    final constraintProvider = Provider.of<ConstraintProvider>(context);
    Widget mapWidget(){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          TitleTheme().titleTheme('Sección Cuatro',2),
          SizedBox(height: 10,),
          CommonWidgets().CardWidgetLabeled(
              context: context,
              widget: Column(
                children: [
                  LatLngWidget(),
                  (constraintProvider.screenType == 2)
                  ? Row(
                    children: [
                      Expanded(child:  Container(),),
                      CommonWidgets().ElevatedButtonWidget(
                          context: context,
                          title: 'Ver Mapa',
                          widget: 'map'),
                      SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: (){
                          SelectSubsection().resetValues(context);
                          Alert(
                              context: context,
                              content: Column(
                                children: <Widget>[
                                  Icon(Icons.map, size: 50, color: Theme.of(context).accentColor,),
                                  TextField(
                                    controller: controllerLat,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.arrow_forward_outlined),
                                      labelText: 'Latitude',
                                    ),
                                  ),
                                  TextField(
                                    controller: controllerLng,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.arrow_upward_outlined),
                                      labelText: 'Longitud',
                                    ),
                                  ),
                                ],
                              ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Guardar",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),

                                onPressed: () {
                                  sectionCuatroProvider.mapId++;
                                  if (double.tryParse(controllerLat.text) == null || double.tryParse(controllerLng.text) == null){
                                    print('Erro');
                                  }else {
                                    sectionCuatroProvider.latNew = controllerLat.text;
                                    sectionCuatroProvider.lngNew = controllerLng.text;
                                    print("TODO");
                                    RequestService().replaceMap(context);

                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ).show();
                        },
                        child: Text('Editar'),
                      ),
                      SizedBox(width: 20,),
                    ],
                  )
                  : Column(
                    children: [
                      SizedBox(height: 10,),
                      CommonWidgets().ElevatedButtonWidget(
                          context: context,
                          title: 'Ver Mapa',
                          widget: 'map'),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: (){
                          SelectSubsection().resetValues(context);
                          Alert(
                            context: context,
                            content: Column(
                              children: <Widget>[
                                Icon(Icons.map, size: 50, color: Theme.of(context).accentColor,),
                                TextField(
                                  controller: controllerLat,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.arrow_forward_outlined),
                                    labelText: 'Latitude',
                                  ),
                                ),
                                TextField(
                                  controller: controllerLng,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.arrow_upward_outlined),
                                    labelText: 'Longitud',
                                  ),
                                ),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Guardar",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),

                                onPressed: () {
                                  sectionCuatroProvider.mapId++;
                                  if (double.tryParse(controllerLat.text) == null || double.tryParse(controllerLng.text) == null){
                                    print('Erro');
                                  }else {
                                    sectionCuatroProvider.latNew = controllerLat.text;
                                    sectionCuatroProvider.lngNew = controllerLng.text;
                                    print("TODO");
                                    RequestService().replaceMap(context);

                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ).show();
                        },
                        child: Text('Editar'),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ],
              ),
              label: Text('Mapa'),
              beginSizedBox: false,
              endSizedBox: true),
          SizedBox(height: 10,),
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
