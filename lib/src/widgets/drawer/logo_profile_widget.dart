import 'package:admin_resto_app/src/models/footer_model.dart';
import 'package:admin_resto_app/src/models/section_cuatro_model.dart';
import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:admin_resto_app/src/providers/auth_provider.dart';
import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/providers/section_tres_provider.dart';
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
    final modelProvider = Provider.of<ModelProvider>(context);
    final sectionDosProvider = Provider.of<SectionDosProvider>(context);
    final sectionTresProvider = Provider.of<SectionTresProvider>(context);
    final sectionCuatroProvider = Provider.of<SectionCuatroProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Column(
      children: [
        SizedBox(height: size.height * 0.05,),
        FutureBuilder(
          future: RequestService().loadData(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if (snapshot.hasData){
              utilsProvider.footerModel = FooterModel.fromMap(snapshot.data['footer']);
              utilsProvider.sectionUnoModel = SectionUnoModel.fromMap(snapshot.data['section_1']);

              modelProvider.logo = snapshot.data['logo'];
              modelProvider.slideHeader = List<SlidePromo>.from(snapshot.data["slide_header"].map((x) => SlidePromo.fromMap(x)));

              sectionDosProvider.sectionDosModel = SectionDosModel.fromJson(snapshot.data['section_2']);

              sectionTresProvider.slideRestaurant = List<SlidePromo>.from(snapshot.data["section_3"]["restaurant"].map((x) => SlidePromo.fromMap(x)));;
              sectionTresProvider.slideMoments = List<SlidePromo>.from(snapshot.data["section_3"]["moments"].map((x) => SlidePromo.fromMap(x)));;

              sectionCuatroProvider.sectionCuatro = SectionCuatroModel.fromJson(snapshot.data["section_4"]);
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
        TitleTheme().titleTheme(authProvider.restaurantName,1),
        SizedBox(height: size.height * 0.05,),
      ],
    );
  }
}
