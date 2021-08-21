import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FooterInfoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context);
    //final utilsProvider = Provider.of<UtilsProvider>(context);
    final Size size= MediaQuery.of(context).size;

    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    child: Center(child: TitleTheme().titleTheme("Logo", 3),),
                  ),
                  Expanded(child: Container())
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround
                ,
                children: [
                  Container(
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
                          image: NetworkImage(utilsProvider.footerModel.logoFooter)
                      ),
                    ),
                  ),
                  Container(
                      width: size.width * 0.2,
                      height: 15,
                      child: PageView(
                        children: [
                          Text(utilsProvider.footerModel.logoFooter)
                        ],
                      )
                  ),
                  ElevatedButton(
                      onPressed: () {
                        utilsProvider.loadLogo = 'logo';
                      },
                      child: Text('Editar'))
                ],
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
        SizedBox(height: 30,),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    child: Center(child: TitleTheme().titleTheme("Contacto", 3),),
                  ),
                  Expanded(child: Container())
                ],
              ),
              ListTile(
                title: Text(utilsProvider.footerModel.contacto.direccion, style: TilesTheme().tilesTheme(),),
                leading: Icon(Icons.location_on),
              ),
              ListTile(
                title: Text(utilsProvider.footerModel.contacto.mail, style: TilesTheme().tilesTheme(),),
                leading: Icon(Icons.mail),
              ),
              ListTile(
                title: Text(utilsProvider.footerModel.contacto.telefono, style: TilesTheme().tilesTheme(),),
                leading: Icon(Icons.phone),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  CommonWidgets().ElevatedButtonWidget(context: context, title: 'Editar', widget: 'contacto'),
                  SizedBox(width: size.width * 0.01,)
                ],
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
        SizedBox(height: 30,),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    child: Center(child: TitleTheme().titleTheme("Redes", 3),),
                  ),
                  Expanded(child: Container())
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage('assets/facebook.png'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 40,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage('assets/instagram.png'),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    onPressed: (){
                      Alert(
                          context: context,
                          title: "Instagram",
                          content: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.account_circle),
                                  labelText: 'Username',
                                ),
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Guardar",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            )
                          ]).show();
                    },
                  )
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ],
    );
  }

}
