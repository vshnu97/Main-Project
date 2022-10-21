import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_project/app/interceptor/model/new_token_model.dart';

class InterceptorHelper {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  Future<Dio> getApiClient() async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (response, handler) async {
        final token = await getToken();
        log(token.toString());
        dio.interceptors.clear();
        response.headers.addAll({
          "Authorization": "Bearer $token",
        });
        return handler.next(response);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 403) {
          final refreshToken = await getRefreshToken();
          final id = await getUserId();

          try {
            await dio.post('http://10.0.2.2:8000/user/refresh/',
                data: {'refresh': refreshToken, 'id': id}).then((value) async {
              if (value.statusCode == 200) {
                final object = NewToken.fromJSON(value.data);
                //get new tokens ...
                print("new token---->${object.token}");
                await addToSecureStorage(object);
                //set bearer
                e.requestOptions.headers.addAll({
                  "Authorization": "Bearer ${object.token}",
                });
                //create request with new access token
                final options = Options(
                    method: e.requestOptions.method,
                    headers: e.requestOptions.headers);
                final cloneRequest = await dio.request(e.requestOptions.path,
                    options: options,
                    data: e.requestOptions.data,
                    queryParameters: e.requestOptions.queryParameters);
                return handler.resolve(cloneRequest);
              }
              return handler.next(e);
            });
          } catch (e) {
            log(e.toString());
          }
        }
      },
    ));
    return dio;
  }

  Future<String> getToken() async {
    return await storage.read(key: "token") ?? "";
  }

  Future<String> getRefreshToken() async {
    return await storage.read(key: "refreshToken") ?? "";
  }

  Future<void> addToSecureStorage(NewToken value) async {
    await storage.write(
      key: "token",
      value: value.token,
    );
    log('added to secure storage');
  }

  Future<String> getUserId() async {
    return await storage.read(key: "userID") ?? "";
  }
}
