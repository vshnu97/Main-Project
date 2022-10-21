import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/error.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/lend_tools/model/lend_post_paid_respose.dart';
import 'package:main_project/app/lend_tools/model/lend_post_response.dart';
import 'package:main_project/app/lend_tools/model/rent_category.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/rent_tools/api_service/api_rent_all.dart';

class RentToolsApiService {
//*********************************** Api service Lend post *****************************************//
  Future<LendToolPostResponseModel?> getApi(FormData formData) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.post("${Url.baseUrl}${Url.lendPost}", data: formData);
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return LendToolPostResponseModel.fromJson(response.data);
        } else {
          return LendToolPostResponseModel(message: 'Unknown error');
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }

//*********************************** Api service Job category *****************************************//

  Future<RentCategoryResponseModel?> getLendCategoryApi() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.get("${Url.baseUrl}${Url.getRentCategory}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return RentCategoryResponseModel.fromJson(response.data);
      } else {
        return RentCategoryResponseModel(message: 'Unknown error');
      }
    } 
  }catch (e) {
      return pop(handleError(e));
    }
    return null;}

  //*********************************** Api service lend paid response *****************************************//

  Future<LendToolPaidResponseModel?> getApiLendPaid(String? ordernumber) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.post("${Url.baseUrl}${Url.lendPostPaid}",
            data: {'order_number': ordernumber});
        log('Printing');
        log(response.toString());
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return LendToolPaidResponseModel.fromJson(response.data);
      } else {
        return LendToolPaidResponseModel(message: 'Unknown error');
      }
    } 
  }catch (e) {
      return pop(handleError(e));
    }
    return null;
}
}