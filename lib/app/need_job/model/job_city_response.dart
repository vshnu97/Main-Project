class JobCityResponseModel {
  List<Cities>? citiesList;
  String? message;
  JobCityResponseModel({
    this.citiesList,
    this.message,
  });
  factory JobCityResponseModel.fromJson(List<dynamic> parsedJson) {
    return JobCityResponseModel(
      citiesList: parsedJson == []
          ? []
          : parsedJson.map((i) => Cities.fromJson(i)).toList(),
    );
  }
}

class Cities {
  Cities({
    this.id,
    this.city,
    this.district,
  });

  int? id;
  String? city;
  int? district;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        id: json["id"],
        city: json["city"],
        district: json["district"],
      );
}
