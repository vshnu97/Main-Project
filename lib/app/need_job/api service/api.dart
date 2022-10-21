import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/error.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_job/model/job_category_model.dart';
import 'package:main_project/app/need_job/model/job_city_response.dart';
import 'package:main_project/app/need_job/model/job_district_response.dart';
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
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobPostResponseModel.fromJson(response.data);
        } else {
          return JobPostResponseModel(message: 'Unknown error');
        }
      }
    } catch (e) {
      return pop(handleError(e));
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
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobPostPaidResponseModel.fromJson(response.data);
        } else {
          return JobPostPaidResponseModel(message: 'Unknown error');
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }

//*********************************** Api service Job category *****************************************//

  Future<JobCategoryResponse?> getCategoryApi() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.get("${Url.baseUrl}${Url.jobCategory}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobCategoryResponse.fromJson(response.data);
        } else {
          return JobCategoryResponse(message: 'Unknown error');
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }

//*********************************** Api service District dropdown *****************************************//

  Future<JobDistrictResponseModel?> getDistrictApi() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.get("${Url.baseUrl}${Url.jobDistrict}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobDistrictResponseModel.fromJson(response.data);
        } else {
          return JobDistrictResponseModel(message: 'Unknown error');
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }

  //*********************************** Api service District dropdown *****************************************//

  Future<JobCityResponseModel?> getCityApi(String? value) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.get('http://10.0.2.2:8000/job/showcity/$value/');
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobCityResponseModel.fromJson(response.data);
        } else {
          return JobCityResponseModel(message: 'Unknown error');
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
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
}
