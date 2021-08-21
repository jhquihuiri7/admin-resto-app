import 'package:admin_resto_app/src/models/footer_model.dart';
import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:admin_resto_app/src/utils/themes.dart';
import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/providers/model_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return Column(
      children: [
        SizedBox(height: size.height * 0.05,),
        FutureBuilder(
          future: RequestService().loadData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            final modelProvider = Provider.of<ModelProvider>(context);
            if (snapshot.hasData){
              utilsProvider.footerModel = FooterModel.fromMap(snapshot.data['footer']);
              utilsProvider.sectionUnoModel = SectionUnoModel.fromJson(snapshot.data['section_1']);

              modelProvider.logo = snapshot.data['logo'];

              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: size.height * 0.15,
                    width: size.height * 0.15,
                    child: Image(
                      fit: BoxFit.fill,
                      image: (modelProvider.logoNew == '')
                        ? NetworkImage(modelProvider.logo)
                        : NetworkImage(modelProvider.logoNew),
                    )
                ),
              );
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
        SizedBox(height: size.height * 0.02,),
        TitleTheme().titleTheme('La Sazon',1),
        SizedBox(height: size.height * 0.05,),
      ],
    );
  }
}
