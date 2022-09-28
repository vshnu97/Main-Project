import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InterceptorHelper{
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
    Future<Dio> getApiClient()async{
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {

      },));

    }


     Future<String> getToken() async {
    return await storage.read(key: "token") ?? "";
  }
}
