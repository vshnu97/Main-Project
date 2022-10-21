import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/error.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/need_worker/model/alljobs_response.dart';
import 'package:main_project/app/need_worker/model/filter_category_response.dart';
import 'package:main_project/app/need_worker/model/on_payment_response.dart';
import 'package:main_project/app/rent_tools/api_service/api_rent_all.dart';

class NeedWorkerAPI {
  //********************************* Api get CategoryFiltered  ***********************************//

  Future<CategoryJobResponse?> getFilterCategoryData(id) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.get("http://10.0.2.2:8000/job/viewjob/$id/");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log(response.data.toString());
          return CategoryJobResponse.fromJson(response.data);
        } else {
          return CategoryJobResponse(message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }

  //********************************* Api post on payment  ***********************************//

  Future<PaymentDoneResponseModel?> getPaidWorkerData(workerID) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio
            .post("${Url.baseUrl}${Url.getworkerPaid}", data: {'id': workerID});
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log(response.data.toString());
          return PaymentDoneResponseModel.fromJson(response.data);
        } else {
          return PaymentDoneResponseModel(message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }

  //********************************* Api get all jobs  ***********************************//

  Future<AlljobsModel?> fetchAllJob() async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.get("${Url.baseUrl}${Url.getalljobs}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log(response.data.toString());
          return AlljobsModel.fromJson(response.data);
        } else {
          return AlljobsModel(message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return pop(handleError(e));
    }
    return null;
  }
}
