class ResponseLoginModel {
  String? token;
  String ?refreshToken;
  String? name;
  String? email;
  bool? status;
  String? message;

  ResponseLoginModel(
      { this.token,
       this.email,
       this.name,
       this.refreshToken,
       this.message,
       this.status});
  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
      ResponseLoginModel(
        message: json["message"] ?? 'No response',
        token: json['token'],
        refreshToken: json['refresh'],
        status: json["status"],
        email: json['email'],
        name: json['first_name'],
      );
}
