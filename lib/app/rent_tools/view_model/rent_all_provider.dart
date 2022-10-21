import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/rent_tools/api_service/api_rent_all.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/model/rentall_search_response.dart';
import 'package:main_project/app/utities/widget/debouncer.dart';

class RentAllProvider extends ChangeNotifier {
  RentAllProvider() {
    callRentAllAPI();
  }
  //*********************************** Rent all screen *****************************************//
  List<String> categoryImages = [
    'assests/mech.png',
    'assests/iconelect.png',
    'assests/vehicle.png',
    'assests/agriclture.png',
    'assests/decoratn.png',
    'assests/elctronic.png',
    'assests/construction.png'
  ];
  List<String> categoryTools = [
    'Mechanical Tools',
    'Electrical Tools',
    'Automotive Tools',
    'Agriculture Tools',
    'Decoration Work',
    'Electronics Tools',
    'Construction Tools'
  ];
  List<RentAll> allRentItems = [];
  List<RentAll> mechToolsList = [];

//*********************************** Api response handling *****************************************//
  callRentAllAPI() async {
    RentAllResponseModel? response = await RentAllAPI().getAPI();

    if (response != null) {
      if (response.listAllrents != null) {
        log('+++++++++++++++++++++++++++++++');
        allRentItems.clear();
        allRentItems.addAll(response.listAllrents!);
        categoaryListMech();
        notifyListeners();
      } else {
        pop(response.message.toString());
      }
    } else {
      checking();
    }
  }

  categoaryListMech() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[0]) {
        mechToolsList.add(element);
      }
    }
  }

  //*********************************** Api response(search) *****************************************//
  final _debounser = Debouncer(milliseconds: 1 * 1000);
  bool isLoading = false;
  List searchResultList = [];
  static bool topSearch = true;
  onSearchRent(String query) {
    _debounser.run(() async {
      topSearch = false;
      isLoading = true;
      SearchResponseModel? response = await RentAllAPI().getSearch(query);
      isLoading = false;
      if (response != null) {
        if (response.results != null) {
          searchResultList.clear();
          searchResultList.addAll(response.results!);
          notifyListeners();
        } else {
          pop(response.message!);
        }
      } else {
        pop('no network');
      }
    });
  }
}
