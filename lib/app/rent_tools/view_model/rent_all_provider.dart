import 'package:flutter/material.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/view_model/api_service/api_rent_all.dart';

class RentAllProvider extends ChangeNotifier {
  List<String> categoryImages = [
    'assests/mech.png',
    'assests/electrical.png',
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
  List<Result> allRentItems = [];
  List<Result> mechToolsList = [];
  List<Result> electricalToolsList = [];
  List<Result> automotiveToolsList = [];
  List<Result> agricultureToolsList = [];
  List<Result> elctronicsToolsList = [];
  List<Result> decorationToolsList = [];
  List<Result> constructionToolsList = [];

  RentAllProvider() {
    callRentAllAPI();
  }

  callRentAllAPI() async {
    RentModelClass? response = await RentAllAPI().getAPI();

    if (response != null) {
      if (response.results != null) {
        allRentItems.clear();
        allRentItems.addAll(response.results!);
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

  categoryListElectrical() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[1]) {
        electricalToolsList.add(element);
      }
    }
  }

  categoaryListAuto() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[2]) {
        automotiveToolsList.add(element);
      }
    }
  }

  categoaryListAgri() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[3]) {
        agricultureToolsList.add(element);
      }
    }
  }

  categoaryListDeco() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[4]) {
        decorationToolsList.add(element);
      }
    }
  }

  categoaryListElectronics() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[5]) {
        elctronicsToolsList.add(element);
      }
    }
  }

  categoaryListConst() {
    for (var element in allRentItems) {
      if (element.category!.name == categoryTools[6]) {
        constructionToolsList.add(element);
      }
    }
  }
}

// List<Fuctions> categoaryFunc = [
//   categoaryListMech(),
//   categoryListElectrical,
//   categoaryListAuto,
//   categoaryListAgri,
//   categoaryListDeco,
//   categoaryListElectronics,
//   categoaryListConst
// ];
