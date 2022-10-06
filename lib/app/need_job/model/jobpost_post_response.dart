class JobPostResponseModel {
  JobPostResponseModel({
    this.ordernumber,
    this.message,
  });

  String? ordernumber;

  String? message;

  factory JobPostResponseModel.fromJson(Map<String, dynamic> json) =>
      JobPostResponseModel(
        ordernumber: json["ordernumber"] ?? '',
      );
}
