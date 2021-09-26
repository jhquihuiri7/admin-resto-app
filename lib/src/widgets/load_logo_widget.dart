import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/backend/request_upload.dart';
import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:admin_resto_app/src/providers/model_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/utils/select_subsection.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class LoadLogoWidget extends StatelessWidget {
  final String logo;

  LoadLogoWidget({required this.logo});
  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final modelProvider = Provider.of<ModelProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          height: 225,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 25,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Theme.of(context).accentColor
                  ),
                  child: (utilsProvider.needLoad)
                      ?Image(
                        height: 175,
                        width: size.width * 0.36 * 0.8,
                        image:AssetImage('assets/add_img.png'),
                        fit: BoxFit.cover,
                      )
                      :Image(
                        height: 175,
                        width: size.width * 0.36 * 0.8,
                        image:SelectSubsection().logoImage(context),
                        fit: BoxFit.cover,
                      ),
                  onPressed: () async{
                    MediaInfo mediaInfo = await RequestUpload().imagePicker();
                    utilsProvider.isLoading = true;
                    if (this.logo == 'logo') {
                      await RequestUpload().deleteFile(context,'img', this.logo);
                      modelProvider.logoNew = await RequestUpload().uploadFile(mediaInfo, 'img', mediaInfo.fileName.toString()) as String;
                      await RequestService().replaceLogo(context, modelProvider.logoNew);
                    }else if (this.logo == 'logoFooter'){
                      await RequestUpload().deleteFile(context,'img', this.logo);
                      utilsProvider.logoFooterNew = await RequestUpload().uploadFile(mediaInfo, 'img', mediaInfo.fileName.toString()) as String;
                      utilsProvider.footerModel.logoFooter = utilsProvider.logoFooterNew;
                      await RequestService().replaceFooter(context);
                    }else if (this.logo == 'logoMenu'){
                      await RequestUpload().deleteFile(context,'img', this.logo);
                      utilsProvider.logoMenuNew = await RequestUpload().uploadFile(mediaInfo, 'img', mediaInfo.fileName.toString()) as String;
                      await RequestService().replaceMenuPhoto(context);
                    }else if (this.logo == 'sliderHeader'){
                      modelProvider.slideNew = await RequestUpload().uploadFile(mediaInfo, 'img', mediaInfo.fileName.toString()) as String;
                      modelProvider.slideHeaderNew = modelProvider.slideHeader;
                      modelProvider.slideHeaderNew.add(SlidePromo(img: modelProvider.slideNew));
                      await RequestService().addSlider(context, logo);
                    }else if (this.logo == 'sliderPromo'){
                      modelProvider.slideNew = await RequestUpload().uploadFile(mediaInfo, 'img', mediaInfo.fileName.toString()) as String;
                      utilsProvider.slidePromoNew = utilsProvider.sectionUnoModel.slidePromo;
                      utilsProvider.slidePromoNew.add(SlidePromo(img: modelProvider.slideNew));
                      await RequestService().addSlider(context, logo);
                    }else{
                      print('No Hago Nada');
                    }
                    utilsProvider.needLoad = false;
                    utilsProvider.isLoading = false;
                  },
                ),
              ),
              (utilsProvider.isLoading)
              ? Container(
                height: 25,
                width: 50,
                child: FadeIn(
                  duration: Duration(milliseconds: 300),
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                    colors: [Theme.of(context).primaryColor,Theme.of(context).primaryColorDark, Theme.of(context).primaryColorLight],
                  ),
                ),
              )
              : Container()
            ],
          ),
        ),
      ]
    );
  }
}


