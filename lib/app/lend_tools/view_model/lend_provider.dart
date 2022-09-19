import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project/app/domain/api_end_points.dart';

class LendProvider extends ChangeNotifier {
  String image1 = '';
  String image2 = '';
  String image3 = '';
  String? serverImg1;
  String? serverImg2;
  String? serverImg3;
  String? img1File;
  String? img2File;
  String? img3File;

  pickImage1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    serverImg1 = (image.path);
    img1File = image.path.split('/').last;
    image1 = base64Encode(temp);
    notifyListeners();
  }

  pickImage2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    serverImg2 = (image.path);
    img2File = image.path.split('/').last;
    //  log(serverImg1.toString());
    image2 = base64Encode(temp);
    notifyListeners();
  }

  pickImage3() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    serverImg3 = (image.path);
    img3File = image.path.split('/').last;
    image3 = base64Encode(temp);
    notifyListeners();
  }

  String? dropdownvalue;
  dropdownValueChange(value) {
    dropdownvalue = value;
    notifyListeners();
  }

  postLendTools() async {
    // int category = 1;
    // int city = 1;
    // int district = 1;
    // String title = 'Cutter';
    // String description = 'Top speed cutter';
    // int subMobileNumber = 9895166472;
    // String place = 'Feroke';
    // String address = 'Adress 13 street';
    // int rate = 1200;
    // String slug = 'slug';
    // String priceIn = 'per_day';
    var image1 = serverImg1!;
    var image2 = serverImg2!;
    var image3 = serverImg3!;
   

    FormData formData = FormData.fromMap({
      'district': 1,
      'city': 1,
      'title': 'title',
      'category': 1,
      'discription': 'description',
      'sub_mobile': 9898989889,
      'place': "place",
      'address': "address",
      'rate': 5,
      'slug': "slug",
      "price_in": "rate_day",
      'image': await MultipartFile.fromFile(image1, filename: img1File),
      'image1': await MultipartFile.fromFile(image2, filename: img1File),
      'image3': await MultipartFile.fromFile(image3, filename: img1File)
    });

    // final dataQ = LendModelClass(
    //     category: category,
    //     city: city,
    //     district: district,
    //     title: title,
    //     description: description,
    //     subMobileNumber: subMobileNumber,
    //     place: place,
    //     address: address,
    //     rate: rate,
    //     slug: slug,
    //     priceIn: priceIn,
    //     image1:await MultipartFile.fromFile(image1.path,filename: img1File),
    //     image2: image2,
    //     image3: image3);
    final dio = Dio();
    Response response = await dio.post('', data: formData);
    log(response.toString());
  }
}
