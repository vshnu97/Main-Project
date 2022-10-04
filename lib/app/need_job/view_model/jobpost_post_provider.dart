import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/api%20service/api.dart';
import 'package:main_project/app/need_job/model/jobpost_post.dart';
import 'package:main_project/app/need_job/model/jobpost_post_response.dart';
import 'package:main_project/app/need_job/payment/view_model/post_payment.dart';
import 'package:provider/provider.dart';

class NeedJobPostProvider extends ChangeNotifier {
  //*********************************** Screen view *****************************************//
  final formKey = GlobalKey<FormState>();

  String? checkValidate(String? val) {
    if (val == null) return null;
    if (val.trim().isEmpty) return 'This field is required *';
    return null;
  }
  String? checkPhone(String? val) {
    if (val == null) return null;
    if (val.trim().isEmpty) return 'This field is required *';
    if(val.length<=9) return 'Enter a valid number';
    return null;
    
  }

  //*********************************** Api response manage *****************************************//
  final titleTextController = TextEditingController();
  final descrpTextController = TextEditingController();
  final phoneNumController = TextEditingController();
  final placeTextController = TextEditingController();
  final rateTextController = TextEditingController();
  final addressTextController = TextEditingController();

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
    PostJobResponseModel? response = await NeedJobAPI().getApi(data);
    if (response != null) {
      // ignore: use_build_context_synchronously
      context
          .read<PostJobRazorpayProvider>()
          .jobpostPayment(titleTextController.text);
      if (response.title != null) {
        disposeTextField();
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
