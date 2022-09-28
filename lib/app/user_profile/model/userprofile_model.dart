class UserProfileModel {
  String? name;
  String? mobile;
  String? email;
  String? message;
  UserProfileModel({this.email, this.message, this.mobile, this.name});
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        name: json['first_name'] ?? '',
        mobile: json['mobile'] ?? '',
        email: json['email'] ?? '',
        message: json['message ']??'Something went wrong' 
      );
}
