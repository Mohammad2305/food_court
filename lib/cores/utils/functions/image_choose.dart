import 'dart:io';
import 'package:image_picker/image_picker.dart';


class LocalMedia{
  static final ImagePicker picker = ImagePicker();

  static Future<File?> chooseGalleryImage() async{
    final XFile? galleryPick = await picker.pickImage(source: ImageSource.gallery);
    return File(galleryPick!.path);
  }

  static Future<File?> chooseCameraImage() async{
    final XFile? cameraPick = await picker.pickImage(source: ImageSource.camera);
    return File(cameraPick!.path);
  }

  static Future<File?> chooseCameraVideo() async{
    final XFile? cameraPick = await picker.pickVideo(source: ImageSource.camera);
    return File(cameraPick!.path);
  }

  static Future<File?> chooseGalleryVideo() async{
    final XFile? cameraPick = await picker.pickVideo(source: ImageSource.gallery);
    return File(cameraPick!.path);
  }
}


