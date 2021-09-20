import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SliderWidget extends StatelessWidget {
  final List<Widget> slider = [];
  final String sliderType;
  SliderWidget({required this.sliderType});
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context);
    final utilsProvider = Provider.of<UtilsProvider>(context);
    List<SlidePromo> data = [];

    List<SlidePromo> setSlider(){
      if (sliderType == 'sliderHeader'){

        if (modelProvider.slideHeaderNew.isEmpty){
          print('estoy aqui');
          data = modelProvider.slideHeader;
        }else{
          data = modelProvider.slideHeaderNew;
        }
      }else if (sliderType == 'sliderPromo'){
        data = utilsProvider.sectionUnoModel.slidePromo;
      }
      return data;
    }

    List<Widget> generateSlider (){
      setSlider().forEach((element) {
        final widgetTemp = Image(
          image: NetworkImage(element.img),
          fit: BoxFit.cover,
        );
        slider.add(widgetTemp);
      });
      return slider;
    }
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          autoPlayInterval: 3000,
          isLoop: true,
          children: generateSlider()
      ),
    );
  }
}
