class JobDistrictResponseModel {
  List<Districts>? districtsList;
  String? message;
  JobDistrictResponseModel({
    this.districtsList,
    this.message,
  });
  factory JobDistrictResponseModel.fromJson(List<dynamic> parsedJson) {
    return JobDistrictResponseModel(
      districtsList: parsedJson == []
          ? []
          : parsedJson.map((i) => Districts.fromJson(i)).toList(),
    );
  }
}

class Districts {
  Districts({
    this.id,
    this.district,
  });

  int? id;
  String? district;

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        id: json["id"],
        district: json["district"],
      );
}
