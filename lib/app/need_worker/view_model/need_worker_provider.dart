import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/api%20service/api.dart';
import 'package:main_project/app/need_job/model/job_category_model.dart';
import 'package:main_project/app/need_worker/api_service/api.dart';
import 'package:main_project/app/need_worker/model/alljobs_response.dart';
import 'package:main_project/app/need_worker/model/filter_category_response.dart';
import 'package:main_project/app/need_worker/model/on_payment_response.dart';
import 'package:main_project/app/need_worker/view/employe_afterpay.dart';
import 'package:main_project/app/rent_tools/payment/view/screen_payment_success.dart';
import 'package:main_project/app/routes/routes.dart';

class NeedWorkerProvider extends ChangeNotifier {
  NeedWorkerProvider() {
    getUserHireCount();
    getCategory();
    getAlljobsDatas();
  }

//********************************* Api response CategoryFiltered(worker)  ***********************************//

  List<FilterOnJobCateResponseModel> sortedData = [];
  categoryFiltered(id) async {
    CategoryJobResponse? response =
        await NeedWorkerAPI().getFilterCategoryData(id);
    if (response != null) {
      for (var element in response.listFilteredData!) {
        sortedData.add(element);
      }

      notifyListeners();
    } else {
      pop('Something went Wrong');
    }
  }

//********************************* Api response WorkerJobCategory  ***********************************//

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

  //********************************* Api response paidWorkerResponse  ***********************************//

  List<PaymentDoneResponseModel> hiredWorkerList = [];
  getPaidWorkerData(String? workerID) async {
    PaymentDoneResponseModel? response =
        await NeedWorkerAPI().getPaidWorkerData(workerID);
    if (response != null) {
      if (response.booked!) {
        hiredWorkerList.clear();
        hiredWorkerList.add(response);
        notifyListeners();
        Routes.pushremoveUntil(
            screen: ScreenPaymentSuccess(
                image: 'assests/paymentsucess.png',
                title: "Payment successful",
                child: ScreenEmployePaymentProfile(
                  hiredWorkerList: hiredWorkerList,
                )));
      }
    } else {
      pop("Something went wrong");
    }
  }

  //********************************* Api response get all jobs  ***********************************//
  List<AlljobsReponseModel> allJobsList = [];

  getAlljobsDatas() async {
    AlljobsModel? response = await NeedWorkerAPI().fetchAllJob();
    if (response != null) {
      for (var element in response.listAlljobsData!) {
        allJobsList.add(element);
      }
      notifyListeners();
    } else {
      pop("Something went wrong");
    }
  }
  //********************************* Image new worker listview  ***********************************//

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
    'assests/elect.webp',
    'assests/plumbr.webp',
    'assests/farmr.webp',
    'assests/clean.webp',
    'assests/house.webp',
    'assests/mechani.jpg',
    'assests/barbr.webp',
    'assests/carpntr.webp',
    'assests/tailr.webp',
    'assests/weldr.webp',
    'assests/elec.webp',
    'assests/constru.webp',
    'assests/othrs.webp',
  ];


  String? countHired;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  getUserHireCount() async {
    countHired = await storage.read(key: 'COUNT');
  }
}
