class ResponseOTP {
  String? email;
  bool? isActive;
  String? message;
  ResponseOTP({this.email, this.isActive,this.message});

  factory ResponseOTP.fromJson(Map<String, dynamic> json) => ResponseOTP(
        email: json["email"] ?? '',
        isActive: json["is_active"] ?? '',
         message: json["error"] ?? ''
      );
}
