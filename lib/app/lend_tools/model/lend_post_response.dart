class LendToolPostResponseModel {
  LendToolPostResponseModel({
    this.ordernumber,
    this.message,
  });

  String? ordernumber;
  String? message;

  factory LendToolPostResponseModel.fromJson(Map<String, dynamic> json) =>
      LendToolPostResponseModel(
        ordernumber: json["ordernumber"] ?? '',
      );
}
