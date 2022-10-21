// class ResponseLoginModel {
//   String? token;
//   String? refreshToken;
//   String? name;
//   String? email;
//   bool? status;
//   String? message;
//   String? userId;

//   ResponseLoginModel(
//       {this.token,
//       this.email,
//       this.name,
//       this.refreshToken,
//       this.message,
//       this.userId,
//       this.status});
//   factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
//       ResponseLoginModel(
//         message: json["message"] ?? 'No response',
//         token: json['token'],
//         refreshToken: json['refresh'],
//         status: json["status"],
//         email: json['email'],
//         name: json['first_name'],
//         userId: json['id'],
//       );
// }
// To parse this JSON data, do
//
//     final responseLoginModel = responseLoginModelFromJson(jsonString);




class ResponseLoginModel {
    ResponseLoginModel({
        this.token,
        this.refresh,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.count,
        this.isAdmin,
        this.status,
        this.message,
    });

    String? token;
    String? refresh;
    int? id;
    String? firstName;
    String? lastName;
    String? email;
    int? count;
    bool? isAdmin;
    bool? status;
    String? message;

    factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => ResponseLoginModel(
        token: json["token"] ?? null,
        refresh: json["refresh"] ?? null,
        id: json["id"] ?? null,
        firstName: json["first_name"] ?? null,
        lastName: json["last_name"] ?? null,
        email: json["email"] ?? null,
        count: json["count"] ?? null,
        isAdmin: json["is_admin"] ?? null,
        status: json["status"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "token": token ?? null,
        "refresh": refresh ?? null,
        "id": id ?? null,
        "first_name": firstName ?? null,
        "last_name": lastName ?? null,
        "email": email ?? null,
        "count": count ?? null,
        "is_admin": isAdmin ?? null,
        "status": status ?? null,
    };
}
