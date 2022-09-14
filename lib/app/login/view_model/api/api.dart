// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:main_project/app/domain/api_end_points.dart';
// import 'package:main_project/app/login/model/model.dart';

// class API {
//    final TextEditingController loginEmailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
//   Future<LoginModelClass?> loginUser() async{
//  final email = loginEmailController.text;
//     final password = passwordController.text;
//     final dataQ = LoginModelClass(email: email, password: password);
//     try{
//       Response response = await dio.post(Url.login, data: dataQ.toJson());
//     }catch(e){
//       log('LoginAPI catch => ${e.toString()}');
//       if (e is DioError) {
//         if (e.response?.data == null) {
//           return LoginModelClass(message: 'Something went wrong!');
//         }
//         return UserDataModel(
//           message: e.response!.data['message'],
//         );
//       } else {
//         return UserDataModel(message: e.toString());
//       }
//     }

//   }
// }