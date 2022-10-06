import 'dart:async';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/model/rentall_search_response.dart';

class RentAllAPI {
//*********************************** Api service get rent all details *****************************************//

  Future<RentModelClass?> getAPI() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.get("${Url.baseUrl}${Url.rentAll}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return RentModelClass.fromJson(response.data);
        } else {
          return RentModelClass(message: "Unknown Error occured");
        }
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return RentModelClass(message: 'Something went wrong!');
      } else if (e.type == DioErrorType.connectTimeout) {
        return RentModelClass(message: 'Check your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return RentModelClass(message: 'Unable to connect to the server');
      } else if (e.type == DioErrorType.other) {
        return RentModelClass(message: 'Something went wrong');
      }
    } catch (e) {
      return RentModelClass(message: 'Server Down');
    }
    return null;
  }

//*********************************** Api service search(rent all) *****************************************//

  Future<SearchResponseModel?> getSearch(String query) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio
            .get("${Url.baseUrl}${Url.rentAllSearch}", queryParameters: {
          "search": query,
        });
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return SearchResponseModel(
              results: List<ResultX>.from(
                  (response.data as List).map((x) => ResultX.fromJson(x))));
        } else {
          return SearchResponseModel(message: "Unknown Error occured");
        }
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return SearchResponseModel(message: 'Something went wrong!');
      } else if (e.type == DioErrorType.connectTimeout) {
        return SearchResponseModel(message: 'Check your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return SearchResponseModel(message: 'Unable to connect to the server');
      } else if (e.type == DioErrorType.other) {
        return SearchResponseModel(message: 'Something went wrong');
      }
    } catch (e) {
      return SearchResponseModel(message: 'Server Down');
    }
    return null;
  }
}

//*********************************** Internet checking *****************************************//
checking() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    print('Got internet');
  } else {
    pop('No network connection');
  }
  return result;
}
