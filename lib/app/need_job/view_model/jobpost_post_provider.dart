
import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/api%20service/api.dart';
import 'package:main_project/app/need_job/model/jobpost_paid_response.dart';
import 'package:main_project/app/need_job/model/jobpost_post.dart';
import 'package:main_project/app/need_job/model/jobpost_post_response.dart';
import 'package:main_project/app/need_job/payment/view_model/post_payment.dart';
import 'package:main_project/app/rent_tools/payment/view/screen_payment_success.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';
import 'package:provider/provider.dart';
import '../payment/view/screen_postjob_success.dart';

class NeedJobPostProvider extends ChangeNotifier {
  //*********************************** Screen view *****************************************//
  final formKeys = GlobalKey<FormState>();

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
    } else if (date == null) {
      pop('Pick a date ');
      return;
    }
    final data = JobPostModel(
        district: 1,
        city: 1,
        address: addressTextController.text,
        category: categoryValue!.toInt(),
        date: date.toString(),
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
        Routes.push(
            screen: ScreenPaymentSuccess(
                image: 'assests/paymentsucess.png',
                title: "Payment successful",
                child: ScreenJobPostSuccess(response: response)));
      }
    }
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
    "Electrical",
    "Plumbing",
    "Agriculture",
    'Cleaning',
    'House keeping',
    'Mechanic',
    'Barber',
    'Carpender',
    'Tailor',
    'Welder',
    'Electronics service',
    'Constructions',
    'Others..'
  ];
  String? dropdownvalue;
  int index = 0;
  int? categoryValue;
  changeDropName(dynamic value) {
    dropdownvalue = value;
    categoryValue = (categories.indexOf(value) + 1);
    notifyListeners();
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
  }
}
