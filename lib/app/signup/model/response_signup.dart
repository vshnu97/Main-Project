class ResponseSignUpModel {
  String? name;
  String? mobile;
  String? email;
  bool? isActive;
  String? message;

  ResponseSignUpModel(
      {this.email,
      this.isActive, 
       this.mobile, this.name, this.message});

  factory ResponseSignUpModel.fromJson(Map<String, dynamic> json) =>
      ResponseSignUpModel(
          name: json["first_name"] ?? '',
          mobile: json["mobile"] ?? '',
          email: json["email"] ?? '',
          isActive: json["is_active"] ?? '',
          message: json["error"] ?? '');
}
