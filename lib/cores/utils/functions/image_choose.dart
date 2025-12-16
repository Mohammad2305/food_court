import 'package:image_picker/image_picker.dart';


class LocalMedia{
  static final ImagePicker picker = ImagePicker();

  static Future<String?> chooseGalleryImage() async{
    final XFile? galleryPick = await picker.pickImage(source: ImageSource.gallery);
    return galleryPick?.path;
  }

  static Future<String?> chooseCameraImage() async{
    final XFile? cameraPick = await picker.pickImage(source: ImageSource.camera);
    return cameraPick?.path;
  }

  static Future<String?> chooseCameraVideo() async{
    final XFile? cameraPick = await picker.pickVideo(source: ImageSource.camera);
    return cameraPick?.path;
  }

  static Future<String?> chooseGalleryVideo() async{
    final XFile? cameraPick = await picker.pickVideo(source: ImageSource.gallery);
    return cameraPick?.path;
  }
}


