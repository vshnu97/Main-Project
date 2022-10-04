import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project/app/login/view/widgets/snackbar.dart';
import 'package:main_project/app/user_profile/api%20service/api_service.dart';
import 'package:main_project/app/user_profile/model/userprofile_model.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfileProvider() {
    getUserData();
  }
  FlutterSecureStorage storage = const FlutterSecureStorage();
  static bool profileLoaded = false;
  String userImage = '';
  UserProfileModel? userData;
  pickUserImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    userImage = base64Encode(temp);
    notifyListeners();
  }

  getUserData() async {
    if (profileLoaded) {
      return;
    }
    UserProfileModel? response = await UserAPI().fetchUser();
    log(response.toString());
    if (response != null) {
      if (response.name != null) {
        saveUserData(response);
        userData = response;
        notifyListeners();
      } else {
        pop(response.message!);
      }
    } else {
      pop('No network');
    }
  }

  saveUserData(UserProfileModel value) async {
    await storage.write(key: 'userEmail', value: value.email);
    await storage.write(key: 'userPhone', value: value.mobile);
  }
 
}
