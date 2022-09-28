import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project/app/user_profile/api%20service/api_service.dart';
import 'package:main_project/app/user_profile/model/userprofile_model.dart';

class UserProfileProvider extends ChangeNotifier {
  static bool profileLoaded = false;
  String userImage = '';
  UserProfileModel? userData;
  pickUserImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    userImage = base64Encode(temp);
    notifyListeners();
  }

   getUserData()async{
     if(profileLoaded){
      return;
    }
  UserProfileModel? response =await UserAPI().fetchUser();
  if(response!=null){
    if(response.name!=null){
      userData=response;
      notifyListeners();

    }
  }
   }

 
}
