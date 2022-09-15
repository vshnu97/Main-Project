import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LendProvider extends ChangeNotifier {
  String imageQ = '';

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    imageQ = base64Encode(temp);
    notifyListeners();
  }
}
