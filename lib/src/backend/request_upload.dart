import 'dart:typed_data';

import 'package:admin_resto_app/src/utils/common_funtions.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class RequestUpload {
  Future<MediaInfo> imagePicker() async {
    MediaInfo mediaInfo = await ImagePickerWeb.getImageInfo;
    return mediaInfo;
  }
  Future<String?> uploadFile(
      MediaInfo mediaInfo, String refString, String fileName) async {
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
  Future deleteFile(BuildContext context, String refString, String logo) async {
    final modelProvider = Provider.of<ModelProvider>(context, listen: false);
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    String child = '';
    if ( logo == 'logo') {
      child = (modelProvider.logoNew == '')
          ? CommonFuntions().transformText(modelProvider.logo)
          : CommonFuntions().transformText(modelProvider.logoNew);
    }else if (logo == 'logoFooter'){
      child = (utilsProvider.logoFooterNew == '')
          ? CommonFuntions().transformText(utilsProvider.footerModel.logoFooter)
          : CommonFuntions().transformText(utilsProvider.logoFooterNew);
    }else if (logo == 'logoMenu'){
      child = (utilsProvider.logoMenuNew == '')
          ? CommonFuntions().transformText(utilsProvider.sectionUnoModel.menuPhoto)
          : CommonFuntions().transformText(utilsProvider.logoMenuNew);
    }else if (logo == 'deleteSliderHeader'){
      child = CommonFuntions().transformText(modelProvider.slideToDelete.img);
    }
    print(child);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref(refString).child(child);
    try {
      await ref.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }

}