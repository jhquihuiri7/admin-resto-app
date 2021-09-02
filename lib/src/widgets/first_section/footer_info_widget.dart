import 'package:admin_resto_app/src/providers/footer_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/utils/themes.dart';
import 'package:admin_resto_app/src/widgets/first_section/social_media_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_resto_app/src/widgets/export_widget.dart';


class FooterInfoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final footerProvider = Provider.of<FooterProvider>(context);
    final Size size= MediaQuery.of(context).size;
    Widget cardUno (){
      return CommonWidgets().logoInfoForCard(context: context, logo: 'logoFooter');
    }
    Widget cardDos (){
      return Column(
        children: [
          ListTile(
            title: Text(
              (footerProvider.direccion == '')
                ? utilsProvider.footerModel.contacto.direccion
                : footerProvider.direccion
              , style: TilesTheme().tilesTheme(),),
            leading: Icon(Icons.location_on),
          ),
          ListTile(
            title: Text(
              (footerProvider.mail == '')
                  ? utilsProvider.footerModel.contacto.mail
                  : footerProvider.mail
              , style: TilesTheme().tilesTheme(),),
            leading: Icon(Icons.mail),
          ),
          ListTile(
            title: Text(
              (footerProvider.telefono == '')
                  ? utilsProvider.footerModel.contacto.telefono
                  : footerProvider.telefono
              , style: TilesTheme().tilesTheme(),),
            leading: Icon(Icons.phone),
          ),
          Row(
            children: [
              Expanded(child: Container()),
              CommonWidgets().ElevatedButtonWidget(context: context, title: 'Editar', widget: 'contacto'),
              SizedBox(width: size.width * 0.01,)
            ],
          ),
        ],
      );
    }
    Widget cardTres (){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaButtonWidget(red: 'Facebook'),
              SizedBox(width: 40,),
              SocialMediaButtonWidget(red: 'Instagram'),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        CommonWidgets().CardWidgetLabeled(
            context: context,
            widget: cardUno(),
            label: TitleTheme().titleTheme('Logo', 3),
            beginSizedBox: true,
            endSizedBox: true),
        SizedBox(height: 30,),
        CommonWidgets().CardWidgetLabeled(
            context: context,
            widget: cardDos(),
            label: TitleTheme().titleTheme('Contacto', 3),
            beginSizedBox: false,
            endSizedBox: true),
        SizedBox(height: 30,),
        CommonWidgets().CardWidgetLabeled(
            context: context, 
            widget: cardTres(), 
            label: TitleTheme().titleTheme('Redes', 3),
            beginSizedBox: true,
            endSizedBox: true),
      ],
    );
  }

}
