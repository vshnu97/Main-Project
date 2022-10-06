import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/model/jobpost_paid_response.dart';
import 'package:main_project/app/need_job/model/jobpost_post.dart';
import 'package:main_project/app/need_job/model/jobpost_post_response.dart';

class NeedJobAPI {
//*********************************** Api service post *****************************************//

  Future<JobPostResponseModel?> getApi(JobPostModel data) async {
    Dio dio = await InterceptorHelper().getApiClient();

    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.post("${Url.baseUrl}${Url.jobPost}", data: data.toJson());

        return JobPostResponseModel.fromJson(response.data);
      } else {
        return JobPostResponseModel(message: 'Unknown error');
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return JobPostResponseModel(message: 'Something went wrong!');
      } else if (e.type == DioErrorType.connectTimeout) {
        return JobPostResponseModel(message: 'Check your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return JobPostResponseModel(message: 'Unable to connect to the server');
      } else if (e.type == DioErrorType.other) {
        return JobPostResponseModel(message: 'Something went wrong');
      }
    } catch (e) {
      return JobPostResponseModel(message: 'Server Down');
    }
    return null;
  }

//*********************************** Api service post (after payment success) *****************************************//

  Future<JobPostPaidResponseModel?> getApiPaid(String? ordernumber) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.post("${Url.baseUrl}${Url.jobpostpPaid}",
            data: {'order_number': ordernumber});
        log('Printing');
        log(response.toString());

        return JobPostPaidResponseModel.fromJson(response.data);
      } else {
        return JobPostPaidResponseModel(message: 'Unknown error');
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return JobPostPaidResponseModel(message: 'Something went wrong!');
      } else if (e.type == DioErrorType.connectTimeout) {
        return JobPostPaidResponseModel(message: 'Check your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return JobPostPaidResponseModel(
            message: 'Unable to connect to the server');
      } else if (e.type == DioErrorType.other) {
        return JobPostPaidResponseModel(message: 'Something went wrong');
      }
    } catch (e) {
      return JobPostPaidResponseModel(message: 'Server Down');
    }
    return null;
  }
}

//*********************************** Internet checking fuction *****************************************//

checking() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    print('Got internet');
  } else {
    pop('No network connection');
  }
  return result;
}
