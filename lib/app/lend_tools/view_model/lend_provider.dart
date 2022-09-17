import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LendProvider extends ChangeNotifier {
  String image1 = '';
  String image2 = '';
  String image3 = '';

  pickImage1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    image1 = base64Encode(temp);
    notifyListeners();
  }
  pickImage2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    image2 = base64Encode(temp);
    notifyListeners();
  }
  pickImage3() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    image3 = base64Encode(temp);
    notifyListeners();
  }

  String? dropdownvalue;
  dropdownValueChange(value) {
    dropdownvalue = value;
    notifyListeners();
  }
}
