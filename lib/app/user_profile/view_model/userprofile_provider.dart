import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/routes/routes.dart';
import 'package:main_project/app/user_profile/api%20service/api_service.dart';
import 'package:main_project/app/user_profile/model/hire_worker_history.dart';
import 'package:main_project/app/user_profile/model/jobpost_history.dart';
import 'package:main_project/app/user_profile/model/userprofile_model.dart';
import 'package:main_project/app/user_profile/view/screen_jobs_added_history.dart';
import 'package:main_project/app/user_profile/view/screen_worker_hired_history.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfileProvider() {
    getUserData();
  }

  //********************************* profile page  ***********************************//

  FlutterSecureStorage storage = const FlutterSecureStorage();
  static bool profileLoaded = false;
  String userImage = '';
  UserProfileModel? userData;
  pickUserImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    userImage = base64Encode(temp);
    notifyListeners();
  }

  //********************************* fetch user data  ***********************************//
  getUserData() async {
    if (profileLoaded) {
      return;
    }
    UserProfileModel? response = await UserAPI().fetchUser();
    log(response.toString());
    if (response != null) {
      if (response.name != null) {
        saveUserData(response);
        userData = response;
        notifyListeners();
      } else {
        pop(response.message!);
      }
    } else {
      pop('No network');
    }
  }

//*********************************  Get user job post history data(api)  ***********************************//

  List<HistoryResponse> postHistoryList = [];
  getJobposHistorydata() async {
    PostJobHistoryResponseModel? response =
        await UserAPI().fetchJobpostHistory();
    if (response != null) {
      for (var element in response.listResponse!) {
        postHistoryList.add(element);
      }
      notifyListeners();
      Routes.push(screen: const ScreenJobPostedHistory());
    } else {
      pop('Something went Wrong');
    }
  }

  dateSplit(String createdMonth) {
    switch (createdMonth) {
      case '1':
        return 'JAN';
      case '2':
        return 'FEB';
      case '3':
        return 'MAR';
      case '4':
        return 'APR';
      case '5':
        return 'MAY';
      case '6':
        return 'JUN';
      case '7':
        return 'JUL';
      case '8':
        return 'AUG';
      case '9':
        return 'SEPT';
      case '10':
        return 'OCT';
      case '11':
        return 'NOV';
      case '12':
        return 'DEC';
    }
  }

  //*********************************  Get user Worker hired history data(api)  ***********************************//
  List<HireWokers> workerHiredHistoryList = [];
  getHiredHistorydata() async {
    HireWokerHistoryResponseModel? response =
        await UserAPI().fetchWokerHiredHistory();
    if (response != null) {
      for (var element in response.listHired!) {
        workerHiredHistoryList.add(element);
      }
      notifyListeners();
      Routes.push(screen: const ScreenWokerHiredHistory());
    } else {
      pop('Something went Wrong');
    }
  }

  saveUserData(UserProfileModel value) async {
    await storage.write(key: 'userEmail', value: value.email);
    await storage.write(key: 'userPhone', value: value.mobile);
    await storage.write(key: 'COUNT', value: value.count.toString());
  }
}
