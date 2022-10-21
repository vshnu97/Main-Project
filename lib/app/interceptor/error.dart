import 'dart:developer';
import 'package:dio/dio.dart';

String handleError(e) {
  String defaultApiError = 'Something went wrong!';
  String networkError = 'No connection';

  if (e is DioError) {
    log(e.message);
    if (e.response == null) {
      return networkError;
    } else if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      return networkError;
    } else if (e.type == DioErrorType.response) {
      if (e.response!.statusCode == 400) {
        return e.response?.data["error"];
      } else {
        return defaultApiError;
      }
    } 
  }
  return defaultApiError;
}