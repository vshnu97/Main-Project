import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/model/jobpost_post.dart';
import 'package:main_project/app/need_job/model/jobpost_post_response.dart';

class NeedJobAPI {
  getApi(JobPostModel data) async {
    Dio dio = await InterceptorHelper().getApiClient();
    print("inter");
    try {
      final network = await checking();
      if (network) {
        print('api strt');
        Response response = await dio.post('http://10.0.2.2:8000/job/jobpost/',
            data: data.toJson());
        print('api');
        log(response.toString());
        return PostJobResponseModel.fromJson(response.data);
      } else {
        return PostJobResponseModel(message: 'Unknown error');
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return PostJobResponseModel(message: 'Something went wrong!');
      } else if (e.type == DioErrorType.connectTimeout) {
        return PostJobResponseModel(message: 'Check your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return PostJobResponseModel(message: 'Unable to connect to the server');
      } else if (e.type == DioErrorType.other) {
        return PostJobResponseModel(message: 'Something went wrong');
      }
    } catch (e) {
      return PostJobResponseModel(message: 'Server Down');
    }
  }

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
