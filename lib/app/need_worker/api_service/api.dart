import 'package:dio/dio.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/need_worker/model/filter_category_response.dart';
import 'package:main_project/app/rent_tools/api_service/api_rent_all.dart';

class NeedWorkerAPI {
  Future<CategoryJobResponse?> getFilterCategoryData(id) async {
    Dio dio = await InterceptorHelper().getApiClient();
    try {
      final network = await checking();
      if (network) {
        Response response =
            await dio.get("http://10.0.2.2:8000/job/viewjob/$id");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return CategoryJobResponse.fromJson(response.data);
        } else {
          return CategoryJobResponse(message: "Unknown Error occured");
        }
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return CategoryJobResponse(message: 'Something went wrong!');
      } else if (e.type == DioErrorType.connectTimeout) {
        return CategoryJobResponse(message: 'Check your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return CategoryJobResponse(message: 'Unable to connect to the server');
      } else if (e.type == DioErrorType.other) {
        return CategoryJobResponse(message: 'Something went wrong');
      }
    } catch (e) {
      return CategoryJobResponse(message: 'Server Down');
    }
    return null;
  }
}
