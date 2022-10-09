class JobCategoryResponse {
  List<JobCategoryResponseModel>? listOfSlots;
  String? message;
  JobCategoryResponse({
    this.listOfSlots,
    this.message,
  });
  factory JobCategoryResponse.fromJson(List<dynamic> parsedJson) {
    return JobCategoryResponse(
      listOfSlots: parsedJson == []
          ? []
          : parsedJson
              .map((i) => JobCategoryResponseModel.fromJson(i))
              .toList(),
    );
  }
}

class JobCategoryResponseModel {
  JobCategoryResponseModel({
    this.id,
    this.name,
    this.categoryOf,
    this.image,
  });

  int? id;
  String? name;
  String? categoryOf;
  dynamic image;

  factory JobCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      JobCategoryResponseModel(
        id: json["id"],
        name: json["name"],
        categoryOf: json["category_of"],
        image: json["image"],
      );
}
