
import 'dart:typed_data';

import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/providers/model_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mime_type/mime_type.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class LoadLogoWidget extends StatelessWidget {

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
                  child: (modelProvider.logoNew == '')
                      ?Image(
                        height: 175,
                        width: size.width * 0.36 * 0.8,
                        image:AssetImage('assets/add_img.png'),
                        fit: BoxFit.cover,
                      )
                      :Image(
                        height: 175,
                        width: size.width * 0.36 * 0.8,
                        image:NetworkImage(modelProvider.logoNew),
                        fit: BoxFit.cover,
                      ),
                  onPressed: () async{
                    MediaInfo mediaInfo = await imagePicker();
                    utilsProvider.isLoading = true;
                    modelProvider.logoNew = await uploadFile(mediaInfo, 'img', mediaInfo.fileName.toString(), utilsProvider) as String;
                    await RequestService().replaceLogo(context, modelProvider.logoNew);
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
                    colors: const [Color(0xfffe6d6a),Color(0xff102689),Color(0xffffc37a)],
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
Future<void> listExample() async {
  firebase_storage.ListResult result =
  await firebase_storage.FirebaseStorage.instance.ref().listAll();

  result.items.forEach((firebase_storage.Reference ref) {
    print('Found file: $ref');
  });

  result.prefixes.forEach((firebase_storage.Reference ref) {
    print('Found directory: $ref');
  });
}

Future<MediaInfo> imagePicker() async {
  MediaInfo mediaInfo = await ImagePickerWeb.getImageInfo;
  return mediaInfo;
}

Future<String?> uploadFile(
    MediaInfo mediaInfo, String refString, String fileName, UtilsProvider provider) async {
  try {
    String? mimeType = mime(path.basename(mediaInfo.fileName.toString()));

    var metadata = firebase_storage.SettableMetadata(
      contentType: mimeType,
    );
    Uint8List info = mediaInfo.data as Uint8List;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref(refString).child(fileName);
    firebase_storage.TaskSnapshot uploadTaskSnapshot =
    await ref.putData(info , metadata);

    String imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
    print("download url $imageUri");
    return imageUri;
  } catch (e) {
    print("File Upload Error $e");
    return null;
  }
}

