import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/first_section/slider_widget.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SectionUnoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget mainLogoSectionUno (){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          TitleTheme().titleTheme('Mi Logo',2),
          SizedBox(height: 10,),
          CommonWidgets().CardWidgetBasic(widget: CommonWidgets().logoInfoForCard(context: context, logo: 'logo')),
          SizedBox(height: 30,),
        ],
      );
    }
    Widget footerInfoSectionUno (){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          TitleTheme().titleTheme('Footer Info',2),
          SizedBox(height: 10,),
          FooterInfoWidget(),
          SizedBox(height: 30,),
        ],
      );
    }
    Widget infoSliderHeader (){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          TitleTheme().titleTheme('Slider Header',2),
          SizedBox(height: 10,),
          Stack(
            children: [
              CommonWidgets().CardWidgetLabeled(
                  context: context,
                  widget: SliderWidget(sliderType: 'sliderHeader'),
                  label: TitleTheme().titleTheme('Slides',3),
                  beginSizedBox: false,
                  endSizedBox: false),
              Positioned(
                bottom: 20,
                right: 50,
                child: CommonWidgets().ElevatedButtonWidget(
                    context: context,
                    title: 'Editar',
                    widget: 'sliderHeader'),
              )
            ],
          ),
        ],
      );
    }
    Widget infoSectionUno (){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          TitleTheme().titleTheme('Sección Uno',2),
          SizedBox(height: 10,),
          CommonWidgets().logoInfoForCard(context: context, logo: 'logoMenu'),
          SizedBox(height: 20,),
          Stack(
            children: [
              CommonWidgets().CardWidgetLabeled(
                  context: context,
                  widget: SliderWidget(sliderType: 'sliderPromo'),
                  label: TitleTheme().titleTheme('Slides',3),
                  beginSizedBox: false,
                  endSizedBox: false),
              Positioned(
                bottom: 20,
                right: 50,
                child: CommonWidgets().ElevatedButtonWidget(
                    context: context,
                    title: 'Editar',
                    widget: 'sliderPromo'),
              )
            ],
          ),
        ],
      );
    }
    return ListView(
      children: <Widget>[
        SizedBox(height: 15,),
        CommonWidgets().ContainerWidget(widget: mainLogoSectionUno()),
        SizedBox(height: 15,),
        CommonWidgets().ContainerWidget(widget: footerInfoSectionUno()),
        SizedBox(height: 15,),
        CommonWidgets().ContainerWidget(widget: infoSliderHeader()),
        SizedBox(height: 50,),
        CommonWidgets().ContainerWidget(widget: infoSectionUno()),
        SizedBox(height: 50,),
      ],
    );
  }
}
