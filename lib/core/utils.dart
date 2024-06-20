import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class Ultils {
  Future<dynamic> pickImage() async {
    dynamic imageFile;
    final imagePicker = ImagePicker();
    var imagepicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagepicked != null) {
      imageFile = File(imagepicked.path);

      Logger().d('Image Path: ${imageFile.path}');
    } else {
      Logger().d('No image selected!');
    }
    return imageFile;
  }
}
