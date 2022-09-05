class SignUpModelClass {
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  String confirmPassword;

  SignUpModelClass(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "mobile": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword
      };
}
