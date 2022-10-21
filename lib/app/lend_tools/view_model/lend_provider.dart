import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project/app/lend_tools/api_service/api.dart';
import 'package:main_project/app/lend_tools/model/lend_post_paid_respose.dart';
import 'package:main_project/app/lend_tools/model/lend_post_response.dart';
import 'package:main_project/app/lend_tools/model/rent_category.dart';
import 'package:main_project/app/lend_tools/payment/view/lendtool_payment_success.dart';
import 'package:main_project/app/lend_tools/payment/view_model/lend_post_payment.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../rent_tools/payment/view/screen_payment_success.dart';

class LendProvider extends ChangeNotifier {
  LendProvider() {
    getRentCategory();
  }

//*********************************** Screen Lend *****************************************//
  static final formKey = GlobalKey<FormState>();

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
  static String? orderNumber;
  bool isLoading = false;

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
  postLendTools(BuildContext context) async {
    if (categoryValue == null) {
      pop('Select a category');
      return;
    } else if (dateNew == null) {
      pop('Pick a date ');
      return;
    } else if (serverImg1 == null || serverImg2 == null || serverImg3 == null) {
      pop('Select tool image');
      return;
    }
    isLoading = true;
    notifyListeners();
    var image1 = serverImg1!;
    var image2 = serverImg2!;
    var image3 = serverImg3!;

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
      'date': dateNew.toString(),
    });
    LendToolPostResponseModel? response =
        await RentToolsApiService().getApi(formData);
    if (response != null) {
      isLoading = false;
      notifyListeners();
      if (response.ordernumber != null) {
        orderNumber = response.ordernumber;
        log('+++++++++order number printed ++++++++++++++++++');
        log(orderNumber.toString());
        context.read<UserProfileProvider>().getUserData();
        context
            .read<PostLendToolsRazorpayProvider>()
            .lendToolsPostPayment(titleTextController.text);
        disposeTextField();
      } else {
        pop(response.message.toString());
      }
    } else {
      pop('No network');
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleTextController.dispose();
    descrpTextController.dispose();
    phoneNumController.dispose();
    placeTextController.dispose();
    rateTextController.dispose();
    addressTextController.dispose();
  }

  disposeTextField() {
    titleTextController.clear();
    descrpTextController.clear();
    phoneNumController.clear();
    placeTextController.clear();
    rateTextController.clear();
    addressTextController.clear();
    image1 = '';
    image2 = '';
    image3 = '';
    dateNew='';

  }

//*********************************** Date pick *****************************************//
  dynamic dateNow = DateTime.now();
  late String format;
  String? dateNew;

  datePicker(BuildContext context) async {
    DateTime date = (await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: DateTime.now(),
      lastDate: DateTime(2080),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kGreenColor,
            ),
          ),
          child: child!,
        );
      },
    ))!;
    dateNew = DateFormat('yyyy-MM-dd').format(date);
    log(dateNew.toString());
    notifyListeners();
  }

//********************************* Category dropdown ***********************************//
  List categoryList = [];
  int? categoryValue;

  getRentCategory() async {
    RentCategoryResponseModel? response =
        await RentToolsApiService().getLendCategoryApi();
    if (response != null) {
      categoryList.clear();
      for (var element in response.listOfRentCategory!) {
        categoryList.add(element);
      }
      notifyListeners();
    } else {
      pop('Something went Wrong');
    }
  }

//******************************** API integation ****************************//

  getLendToolPostData() async {
    LendToolPaidResponseModel? response =
        await RentToolsApiService().getApiLendPaid(orderNumber);

    if (response != null) {
      if (response.payment!) {
        Routes.pushremoveUntil(
            screen: const ScreenPaymentSuccess(
                image: 'assests/paymentsucess.png',
                title: "Payment successful",
                child: ScreenLendToolPaidSuccess()));
      } else {
        pop('Something went Wrong');
      }
    }
  }
}
