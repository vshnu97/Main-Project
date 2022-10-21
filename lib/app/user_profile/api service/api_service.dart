import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/error.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/user_profile/model/hire_worker_history.dart';
import 'package:main_project/app/user_profile/model/jobpost_history.dart';
import 'package:main_project/app/user_profile/model/userprofile_model.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';

class UserAPI {
  //********************************* Api get User data  ***********************************//

  Future<UserProfileModel?> fetchUser() async {
    try {
      final network = await checking();
      if (network) {
        Dio dio = await InterceptorHelper().getApiClient();
        final response = await dio.get("${Url.baseUrl}${Url.userProfile}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          UserProfileProvider.profileLoaded = true;
          return UserProfileModel.fromJson(response.data);
        } else {
          return UserProfileModel(message: "Something went wrong");
        }
      }
    } catch (e) {
      return UserProfileModel(message: handleError(e));
    }
    return null;
  }

  //********************************* Api get Job post history  ***********************************//

  Future<PostJobHistoryResponseModel?> fetchJobpostHistory() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.get("${Url.baseUrl}${Url.getJobpostHistory}");

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return PostJobHistoryResponseModel.fromJson(response.data);
        } else {
          return PostJobHistoryResponseModel(message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return PostJobHistoryResponseModel(message: handleError(e));
    }
    return null;
  }

  //********************************* Api get worker hired history  ***********************************//

  Future<HireWokerHistoryResponseModel?> fetchWokerHiredHistory() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.get("${Url.baseUrl}${Url.getWokerHireHistory}");

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return HireWokerHistoryResponseModel.fromJson(response.data);
        } else {
          return HireWokerHistoryResponseModel(
              message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return HireWokerHistoryResponseModel(message: handleError(e));
    }
    return null;
  }

  //********************************* Internet checking  ***********************************//

  checking() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('Got internet');
    } else {
      pop('No network connection');
    }
    return result;
  }
}
