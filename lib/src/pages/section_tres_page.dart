import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/slider_widget.dart';
import 'package:flutter/material.dart';

class SectionTresPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget section_3(){
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            TitleTheme().titleTheme('Sección Tres',2),
            SizedBox(height: 10,),
            Stack(
              children: [
                CommonWidgets().CardWidgetLabeled(
                    context: context,
                    widget: SliderWidget(sliderType: 'sliderRestaurant'),
                    label: TitleTheme().titleTheme('Restaurante',3),
                    beginSizedBox: false,
                    endSizedBox: false),
                Positioned(
                  bottom: 20,
                  right: 50,
                  child: CommonWidgets().ElevatedButtonWidget(
                      context: context,
                      title: 'Editar',
                      widget: 'sliderRestaurant',),
                )
              ],
            ),
            SizedBox(height: 10,),
            Stack(
              children: [
                CommonWidgets().CardWidgetLabeled(
                    context: context,
                    widget: SliderWidget(sliderType: 'sliderMoments',),
                    label: TitleTheme().titleTheme('Momentos',3),
                    beginSizedBox: false,
                    endSizedBox: false),
                Positioned(
                  bottom: 20,
                  right: 50,
                  child: CommonWidgets().ElevatedButtonWidget(
                      context: context,
                      title: 'Editar',
                      widget: 'sliderMoments'),
                )
              ],
            ),
          ]
      );
    }
    return ListView(
      children: [
        SizedBox(height: 15,),
        CommonWidgets().ContainerWidget(widget: section_3()),
      ],
    );
  }

}
