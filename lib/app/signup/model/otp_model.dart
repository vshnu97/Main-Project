class OtpModelClass {
  String code;
  String phone;
  OtpModelClass({required this.code, required this.phone});

  Map<String, dynamic> toJson() => {
        'code': code,
        'mobile': phone,
      };
}
