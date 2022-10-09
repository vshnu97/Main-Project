import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';

class LendProvider extends ChangeNotifier {
//*********************************** Screen Lend *****************************************//
  final formKey = GlobalKey<FormState>();

  final titleTextController = TextEditingController();
  final descrpTextController = TextEditingController();
  final phoneNumController = TextEditingController();
  final placeTextController = TextEditingController();
  final rateTextController = TextEditingController();
  final addressTextController = TextEditingController();

  String image1 = '';
  String image2 = '';
  String image3 = '';
  String? serverImg1;
  String? serverImg2;
  String? serverImg3;
  String? img1File;
  String? img2File;
  String? img3File;

  String? checkValidate(String? val) {
    if (val == null) return null;
    if (val.trim().isEmpty) return 'This field is required *';
    return null;
  }

  String? checkPhone(String? val) {
    if (val == null) return null;
    if (val.trim().isEmpty) return 'This field is required *';
    if (val.length <= 9) return 'Enter a valid number';
    return null;
  }

//******************************** Pick Image ********************************//
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

//******************************** API integation ****************************//
  postLendTools() async {
    var image1 = serverImg1!;
    var image2 = serverImg1!;
    var image3 = serverImg1!;
    log(date.toString());
    log(categoryValue.toString());
    FormData formData = FormData.fromMap({
      'district': 1,
      'city': 1,
      'title': titleTextController.text,
      'category': categoryValue,
      'discription': descrpTextController.text,
      'sub_mobile': phoneNumController.text,
      'place': placeTextController.text,
      'address': addressTextController.text,
      'rate': rateTextController.text,
      'slug': "slug",
      "price_in": "rate_day",
      'image': await MultipartFile.fromFile(image1, filename: img1File),
      'image1': await MultipartFile.fromFile(image2, filename: img2File),
      'image2': await MultipartFile.fromFile(image3, filename: img3File),
      'date': date
    });

    Dio dio = await InterceptorHelper().getApiClient();
    Response response =
        await dio.post('http://10.0.2.2:8000/rent/post/', data: formData);
    log(response.toString());
  }

//*********************************** Date pick *****************************************//
  dynamic dateNow = DateTime.now();
  late String format;
  String? date;

  datePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: DateTime.now(),
        lastDate: DateTime(2028));

    var dateTime = DateTime.parse(dateNow.toString());
    var dateTemp = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    date = dateTemp;
    newDate == null ? dateNow : dateNow = newDate;
    notifyListeners();
  }

//********************************* Category dropdown ***********************************//
  List<String> categories = [
    "Electrical Tools",
    "Mechanical Tools",
    "Agriculture Tools",
    'Automotive Tools',
    'Decoration Work',
    'Electronics Tools',
    'Construction Tools',
  ];
  String? dropdownvalue;
  int index = 0;
  int? categoryValue;
  changeDropName(dynamic value) {
    dropdownvalue = value;
    categoryValue = (categories.indexOf(value) + 1);
    print(categoryValue);
    notifyListeners();
  }

//******************************** District dropdown ********************************//
  String? districtDropdown;
  bool disableDropdown = true;
  changeDistrict(value) {
    if (value == 'Kozhikode') {
      filterkozhikode();
    }
    districtDropdown = value;
    disableDropdown = false;
    notifyListeners();
  }

  secondChanged(value) {
    districtDropdown = value;
    notifyListeners();
  }

  filterkozhikode() {
    for (String key in kozhikode.keys) {
      menuItems.add(DropdownMenuItem<String>(
        // ignore: sort_child_properties_last
        child: Center(
          child: Text(kozhikode[key].toString()),
        ),
        value: kozhikode[key],
      ));
    }
  }

  List<String> districts = [
    "Kozhikode",
    "Wayanad",
    "Kannur",
    'Kasargod',
    'Malapuram',
    'Palakad',
    'Thrissur',
    'Ernakulam',
    'Alappuzha',
    'Idukki',
    'Kollam',
    'Kottayam',
    "Pathanamthitta",
    'Trivandrum'
  ];
  //******************************** City dropdown ********************************//

  List<DropdownMenuItem<String>> menuItems = [];

  final kozhikode = {
    '1': 'Palayam',
    '2': 'Kopp',
    '3': 'Beypore',
    '4': 'Koduvally',
    '5': 'Ballusery',
  };
  final wayanad = {
    '1': 'Mananthavady',
    '2': 'Kalpetta',
    '3': 'Bathery',
    '4': 'Vythiri',
  };
  final kannur = {
    '1': 'Kannur N',
    '2': 'Kannur S',
    '3': 'Payyanur',
    '4': 'Thallaserry',
  };
  final kasargod = {
    '1': 'Manjeshwar',
    '2': 'Udma',
    '3': 'Kanhangad',
  };
  final malapuram = {
    '1': 'Vengara',
    '2': 'Vallikunu',
    '3': 'Kondotty',
  };
  final palakad = {
    '1': 'Palakad N',
    '2': 'Palakad S',
    '3': 'Kannadi',
  };
  final thrissur = {
    '1': 'Thrissur N',
    '2': 'Thrissur S',
    '3': 'Guruvayur',
  };
  final ernakulam = {
    '1': 'Aluva',
    '2': 'Kochi',
    '3': 'Edapalli',
  };
  final kollam = {
    '1': 'Kollam N',
    '2': 'Kollam S',
    '3': 'Kottamkara',
  };
  final kottayam = {
    '1': 'Kanjirappally',
    '2': 'Meenachil ',
    '3': 'Vaikom ',
  };
  final idukki = {
    '1': 'Thodupuzha',
    '2': 'Devikulam ',
    '3': 'Cheruthoni ',
  };
  final alapuzha = {
    '1': 'Cherthala',
    '2': 'Kuttnad ',
    '3': 'Ambalapuzha ',
  };
  final pathanamthitta = {
    '1': 'Adoor',
    '2': 'Thiruvala ',
    '3': 'Ranni ',
  };
  final tvm = {
    '1': 'Katakada',
    '2': 'Varkala ',
    '3': 'Neyantinkara ',
  };
}
