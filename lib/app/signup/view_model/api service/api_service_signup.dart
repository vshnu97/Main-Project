import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/signup/model/response_signup.dart';
import 'package:main_project/app/signup/model/signup_model.dart';

class APISignUp {
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  Future<ResponseSignUpModel?> signUpUser(SignUpModelClass dataQ) async {
    try {
      final networkCheck = await checkin();
      if (networkCheck) {
        Response response = await dio.post(Url.signUp, data: dataQ.toJson());
        if (response.statusCode == 200) {
          return ResponseSignUpModel.fromJson(response.data);
        } else {
          return ResponseSignUpModel(message: 'Unknown error');
        }
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return ResponseSignUpModel(message: 'Something went wrong!');
      }
    } catch (e) {
      log('catch');
      return ResponseSignUpModel(message: e.toString());
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
