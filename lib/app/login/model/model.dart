class LoginModelClass {
  String? email;
  String? password;

  LoginModelClass({ this.email,  this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
