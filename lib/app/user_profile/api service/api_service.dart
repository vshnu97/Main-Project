import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_project/app/domain/api_end_points.dart';
import 'package:main_project/app/interceptor/interceptor_helper.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/user_profile/model/userprofile_model.dart';
import 'package:main_project/app/user_profile/view_model/userprofile_provider.dart';

class UserAPI {
  Future<UserProfileModel?> fetchUser() async {
    try {
      final network = await checking();
      if (network) {
        Dio dio = await InterceptorHelper().getApiClient();
        final response = await dio.get("${Url.baseUrl}${Url.userProfile}");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          UserProfileProvider.profileLoaded = true;
          return UserProfileModel.fromJson(response.data);
        } else {
          return UserProfileModel(message: "Something went wrong");
        }
      }
    } on DioError catch (e) {
      print('*********dio error from service********');
      return UserProfileModel.fromJson(e.response!.data);
    } catch (e) {
      print('*********catch error from service********');
      return UserProfileModel(message: e.toString());
    }
    return null;
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
}
