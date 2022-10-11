import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/api%20service/api.dart';
import 'package:main_project/app/need_job/model/job_category_model.dart';
import 'package:main_project/app/need_worker/api_service/api.dart';
import 'package:main_project/app/need_worker/model/filter_category_response.dart';

class NeedWorkerProvider extends ChangeNotifier {
  NeedWorkerProvider() {
    getCategory();
  }

  //********************************* Api response CategoryFiltered  ***********************************//

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

  //********************************* Api response JobCategory  ***********************************//

  List availableList = [];
  int? categoryValue;

  getCategory() async {
    JobCategoryResponse? response = await NeedJobAPI().getCategoryApi();
    if (response != null) {
      availableList.clear();
      for (var element in response.listOfSlots!) {
        availableList.add(element);
        log(availableList.toString());
      }
      notifyListeners();
    } else {
      pop('Something went Wrong');
    }
  }
}
