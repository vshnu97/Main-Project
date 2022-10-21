class RentCategoryResponseModel {
  List<RentCategories>? listOfRentCategory;
  String? message;
  RentCategoryResponseModel({
    this.listOfRentCategory,
    this.message,
  });
  factory RentCategoryResponseModel.fromJson(List<dynamic> parsedJson) {
    return RentCategoryResponseModel(
      listOfRentCategory: parsedJson == []
          ? []
          : parsedJson.map((i) => RentCategories.fromJson(i)).toList(),
    );
  }
}

class RentCategories {
  RentCategories({
    this.id,
    this.name,
    this.categoryOf,
    this.image,
  });

  int? id;
  String? name;
  String? categoryOf;
  dynamic? image;

  factory RentCategories.fromJson(Map<String, dynamic> json) => RentCategories(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        categoryOf: json["category_of"] ?? null,
        image: json["image"],
      );
}
