import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/api%20service/api.dart';
import 'package:main_project/app/need_job/model/job_category_model.dart';
import 'package:main_project/app/need_job/model/job_city_response.dart';
import 'package:main_project/app/need_job/model/job_district_response.dart';
import 'package:main_project/app/need_job/model/jobpost_paid_response.dart';
import 'package:main_project/app/need_job/model/jobpost_post.dart';
import 'package:main_project/app/need_job/model/jobpost_post_response.dart';
import 'package:main_project/app/need_job/payment/view_model/post_payment.dart';
import 'package:main_project/app/rent_tools/payment/view/screen_payment_success.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:main_project/app/utities/colors/colors.dart';
import 'package:provider/provider.dart';
import '../payment/view/screen_postjob_success.dart';

class NeedJobPostProvider extends ChangeNotifier {
  NeedJobPostProvider() {
    getCategory();
    getDistrict();
  }

  //*********************************** Screen view *****************************************//

  static final validateKey = GlobalKey<FormState>();

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

  //*********************************** Api response manage *****************************************//

  final titleTextController = TextEditingController();
  final descrpTextController = TextEditingController();
  final phoneNumController = TextEditingController();
  final placeTextController = TextEditingController();
  final rateTextController = TextEditingController();
  final addressTextController = TextEditingController();
  static String? orderNumber;
  postJobData(BuildContext context) async {
    if (categoryValue == null) {
      pop('Select a category');
      return;
    } else if (dateNew == null) {
      pop('Pick a date ');
      return;
    } else if (districtId == null) {
      pop('Select a District');
      return;
    } else if (cityID == null) {
      pop('Select a City');
      return;
    }
    final data = JobPostModel(
        district: districtId!,
        city: cityID!,
        address: addressTextController.text,
        category: categoryValue!,
        date: dateNew.toString(),
        description: descrpTextController.text,
        mobile: phoneNumController.text,
        place: placeTextController.text,
        rate: rateTextController.text,
        slug: "slug",
        title: titleTextController.text);
    JobPostResponseModel? response = await NeedJobAPI().getApi(data);
    if (response != null) {
      if (response.ordernumber != null) {
        orderNumber = response.ordernumber;
        context.read<UserProfileProvider>().getUserData();

        context
            .read<PostJobRazorpayProvider>()
            .jobpostPayment(titleTextController.text);
        disposeTextField();
        dateNow.clear();
      } else {
        pop(response.message.toString());
      }
    } else {
      pop('No network');
    }
  }

  //*********************************** Api response(payment done) manage *****************************************//

  getJobPostData() async {
    JobPostPaidResponseModel? response =
        await NeedJobAPI().getApiPaid(orderNumber);

    if (response != null) {
      if (response.payment!) {
        Routes.pushremoveUntil(
            screen: ScreenPaymentSuccess(
                image: 'assests/paymentsucess.png',
                title: "Payment successful",
                child: ScreenJobPostSuccess(
                  response: response,
                )));
      }
    } else {
      pop('Something went Wrong');
    }
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

  //*********************************Api response(Category dropdown) ***********************************//

  List availableList = [];
  int? categoryValue;

  getCategory() async {
    JobCategoryResponse? response = await NeedJobAPI().getCategoryApi();
    if (response != null) {
      availableList.clear();
      for (var element in response.listOfSlots!) {
        availableList.add(element);
      }
      notifyListeners();
    } else {
      pop('Something went Wrong');
    }
  }

  //*********************************Api response(District dropdown) ***********************************//

  List districtList = [];
  int? districtId;
  String? dropdownvalue;
  changeDropName(dynamic dropdownvalue) {
    this.dropdownvalue = dropdownvalue;
    notifyListeners();
  }

  getDistrict() async {
    JobDistrictResponseModel? response = await NeedJobAPI().getDistrictApi();
    if (response != null) {
      districtList.clear();
      for (var element in response.districtsList!) {
        districtList.add(element);
      }

      notifyListeners();
    } else {
      pop('Something went Wrong');
    }
  }

  //********************************* Api response(City dropdown) ***********************************//

  List<Cities> citytList = [];
  int? cityID;

  getCity(String? value) async {
    JobCityResponseModel? response = await NeedJobAPI().getCityApi(value);
    if (response != null) {
      log(response.citiesList!.first.city.toString());
      citytList.clear();
      for (var element in response.citiesList!) {
        citytList.add(element);
      }
      notifyListeners();
    } else {
      pop('Something went Wrong');
    }
  }

  //********************************* Image category job  ***********************************//

  String categoryImage(categoryName) {
    switch (categoryName) {
      case 'Electrical':
        return imagesList[0];
      case 'Plumbing':
        return imagesList[1];
      case 'Agriculture':
        return imagesList[2];
      case 'Cleaning':
        return imagesList[3];
      case 'House keeping':
        return imagesList[4];
      case 'Mechanic':
        return imagesList[5];
      case 'Barber':
        return imagesList[6];
      case 'Carpenter':
        return imagesList[7];
      case 'Tailor':
        return imagesList[8];
      case 'Welder':
        return imagesList[9];
      case 'Electronics':
        return imagesList[10];
      case 'Construction':
        return imagesList[11];
      case 'other':
        return imagesList[12];
      default:
        return imagesList[12];
    }
  }

  List<String> imagesList = [
    'assests/electrician.png',
    'assests/plumber.png',
    'assests/farmer.png',
    'assests/cleaning.png',
    'assests/housekeeping.png',
    'assests/mechanic.png',
    'assests/barber.png',
    'assests/carpenter.png',
    'assests/tailor.png',
    'assests/welder.png',
    'assests/electronics.png',
    'assests/constructor.png',
    'assests/other.png',
  ];

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
  }
}
