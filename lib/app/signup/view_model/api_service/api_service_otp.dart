import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/signup/model/otp_model.dart';
import 'package:main_project/app/signup/model/response_otp.dart';

class OtpAPI {
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  Future verifyOTP(OtpModelClass dataQ) async {
    try {
      final network = await networkCheck();
      if (network) {
        Response response = await dio.post(Url.otp, data: dataQ.toJson());
        if (response.statusCode == 200) {
          return ResponseOTP.fromJson(response.data);
        } else {
          return ResponseOTP(message: 'Unknown error');
        }
      }
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return ResponseOTP(message: 'Something went wrong!');
      }
      log(e.response!.data.toString());
      return ResponseOTP(message: e.response!.data["error"]);
    } catch (e) {
      handleError(e);
    }
  }

  String defaultError = 'Something went wrong!';
  handleError(e) {
    if (e is DioError) {
      if (e.message.startsWith('SocketException')) {
        throw 'Check internet connection';
      }
      if (e.response?.data['error'] != null) {
        throw e.response!.data['error'];
      }
      throw defaultError;
    }
    throw e.toString();
  }

  networkCheck() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('Got internet');
    } else {
      pop('No network connection');
    }
    return result;
  }
}
