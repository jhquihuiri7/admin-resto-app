import 'dart:typed_data';

import 'package:admin_resto_app/src/providers/auth_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
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
      BuildContext context,MediaInfo mediaInfo, String fileName) async {
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    try {
      String? mimeType = mime(path.basename(mediaInfo.fileName.toString()));

      var metadata = firebase_storage.SettableMetadata(
        contentType: mimeType,
      );
      Uint8List info = mediaInfo.data as Uint8List;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref(restaurant).child(fileName);
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
  Future deleteFile(BuildContext context, String logo) async {
    final modelProvider = Provider.of<ModelProvider>(context, listen: false);
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final sectionDosProvider = Provider.of<SectionDosProvider>(context, listen: false);
    final restaurant = Provider.of<AuthProvider>(context, listen: false).restaurantPath;
    String child = '';
    if ( logo == 'logo') {
      child = (modelProvider.logoNew == '')
          ? CommonFuntions().transformTextBackend(modelProvider.logo)
          : CommonFuntions().transformTextBackend(modelProvider.logoNew);
    }else if (logo == 'logoFooter'){
      child = (utilsProvider.logoFooterNew == '')
          ? CommonFuntions().transformTextBackend(utilsProvider.footerModel.logoFooter)
          : CommonFuntions().transformTextBackend(utilsProvider.logoFooterNew);
    }else if (logo == 'logoMenu'){
      child = (utilsProvider.logoMenuNew == '')
          ? CommonFuntions().transformTextBackend(utilsProvider.sectionUnoModel.menuPhoto)
          : CommonFuntions().transformTextBackend(utilsProvider.logoMenuNew);
    }else if (logo == 'deleteSliderHeader'){
      child = CommonFuntions().transformTextBackend(modelProvider.slideToDelete.img);
    }else if (logo == 'deleteSliderPromo'){
      child = CommonFuntions().transformTextBackend(modelProvider.slideToDelete.img);
    }else if (logo == 'deleteSliderRestaurant'){
      child = CommonFuntions().transformTextBackend(modelProvider.slideToDelete.img);
    }else if (logo == 'deleteSliderMoments'){
      child = CommonFuntions().transformTextBackend(modelProvider.slideToDelete.img);
    }else if (logo == 'deleteItemMenu'){
      child = CommonFuntions().transformTextBackend(sectionDosProvider.menuItemToDelete);
    }
    print(child);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref(restaurant).child(child);
    try {
      await ref.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }

}