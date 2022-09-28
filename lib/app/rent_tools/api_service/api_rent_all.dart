import 'dart:async';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/rent_tools/model/all_rent_model.dart';

class RentAllAPI {
 
  final dio = Dio(BaseOptions(
    baseUrl: Url.baseUrl,
  ));
  Future<RentModelClass?> getAPI() async {
    try {
      final network = await checking();
      if (network) {
        Response response = await dio.get(Url.rentAll);
        if (response.statusCode == 200) {
          return RentModelClass.fromJson(response.data);
        } else {
          return RentModelClass(message: "Unknown Error occured");
        }
      }
    } catch (e) {
      return RentModelClass(message: e.toString());
    }
    return null;
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
