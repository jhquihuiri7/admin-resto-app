import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SliderSectionUnoWidget extends StatelessWidget {
  final List<Widget> slider = [];

  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context);

    List<Widget> generateSlider (){
      utilsProvider.sectionUnoModel.slidePromo.forEach((element) {
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
