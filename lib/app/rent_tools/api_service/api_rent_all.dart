import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/error.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';
import 'package:main_project/app/rent_tools/model/rentall_search_response.dart';

class RentAllAPI {
//*********************************** Api service get rent all details *****************************************//

  Future<RentAllResponseModel?> getAPI() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.get("http://10.0.2.2:8000/rent/all/");
        log('Incommingggggggggg');
        log(response.toString());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('modelclassssss insde');
        return RentAllResponseModel.fromJson(response.data);
       
        } else {
          return RentAllResponseModel(message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return pop(handleError(e));
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
    } catch (e) {
      return pop(handleError(e));
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
