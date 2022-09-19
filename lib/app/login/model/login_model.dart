class LoginModelClass {
  String email;
  String password;

  LoginModelClass({
   required this.email,
   required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
  
}
