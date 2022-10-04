import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/login/model/login_model.dart';
import 'package:main_project/app/login/model/response_model.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';

class API {
  final dio = Dio(BaseOptions(
    baseUrl: Url.baseUrl,
  ));
  Future<ResponseLoginModel?> loginUser(LoginModelClass dataQ) async {
    try {
      final re = await checkin();
      if (re) {
        Response response = await dio.post(Url.login, data: dataQ.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return ResponseLoginModel.fromJson(response.data);
        }
      }
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
    } on SocketException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          return ResponseLoginModel(message: 'Something went wrong!');
        }
        return ResponseLoginModel.fromJson(
          e.response!.data,
        );
      } else {
        return ResponseLoginModel(message: e.toString());
      }
    }
    return null;
  }

  checkin() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('Got internet');
    } else {
      pop('No network connection');
    }
    return result;
  }
}
