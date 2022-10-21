class UserProfileModel {
  String? name;
  String? mobile;
  String? email;
  String? message;
  int? count;
  UserProfileModel({this.email, this.message, this.mobile, this.name,this.count});
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        name: json['first_name']??'',
        mobile: json['mobile']??'' ,
        email: json['email']??'' ,
        count:json['count']??'',
        message: json['message ']??'Something went wrong' 
      );
}
