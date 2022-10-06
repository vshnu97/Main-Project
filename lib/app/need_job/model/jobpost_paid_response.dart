// class JobPostPaidResponseModel {
//   JobPostPaidResponseModel({
//     this.payment,
//     this.message,
//   });

//   bool? payment;
//   String? message;

//   factory JobPostPaidResponseModel.fromJson(Map<String, dynamic> json) =>
//       JobPostPaidResponseModel(
//         payment: json["payment"],
//       );

//   Map<String, dynamic> toJson() => {
//         "payment": payment,
//       };
// }
// To parse this JSON data, do
//
//     final jobPostPaidResponseModel = jobPostPaidResponseModelFromJson(jsonString);

import 'dart:convert';

JobPostPaidResponseModel jobPostPaidResponseModelFromJson(String str) =>
    JobPostPaidResponseModel.fromJson(json.decode(str));

String jobPostPaidResponseModelToJson(JobPostPaidResponseModel data) =>
    json.encode(data.toJson());

class JobPostPaidResponseModel {
  JobPostPaidResponseModel({
    this.id,
    this.category,
    this.city,
    this.district,
    this.title,
    this.discriptions,
    this.subMobile,
    this.mobile,
    this.address,
    this.place,
    this.payment,
    this.rate,
    this.available,
    this.slug,
    this.ordernumber,
    this.booked,
    this.createdAt,
    this.validAt,
    this.user,
    this.bookedPerson,
    this.message,
  });

  int? id;
  Category? category;
  City? city;
  District? district;
  String? title;
  String? discriptions;
  String? subMobile;
  String? mobile;
  String? address;
  String? place;
  bool? payment;
  int? rate;
  bool? available;
  String? slug;
  String? ordernumber;
  bool? booked;
  String? createdAt;
  DateTime? validAt;
  int? user;
  dynamic bookedPerson;
  String? message;

  factory JobPostPaidResponseModel.fromJson(Map<String, dynamic> json) =>
      JobPostPaidResponseModel(
        id: json["id"] ?? null,
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        title: json["title"] ?? null,
        discriptions:
            json["discriptions"] ?? null,
        subMobile: json["sub_mobile"] ?? null,
        mobile: json["mobile"] ?? null,
        address: json["address"] ?? null,
        place: json["place"] ?? null,
        payment: json["payment"] ?? null,
        rate: json["rate"] ?? null,
        available: json["available"] ?? null,
        slug: json["slug"] ?? null,
        ordernumber: json["ordernumber"] ?? null,
        booked: json["booked"] ?? null,
        createdAt: json["created_at"] ?? null,
        validAt:
            json["valid_at"] == null ? null : DateTime.parse(json["valid_at"]),
        user: json["user"] ?? null,
        bookedPerson: json["booked_person"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "category": category == null ? null : category!.toJson(),
        "city": city == null ? null : city!.toJson(),
        "district": district == null ? null : district!.toJson(),
        "title": title ?? null,
        "discriptions": discriptions ?? null,
        "sub_mobile": subMobile ?? null,
        "mobile": mobile ?? null,
        "address": address ?? null,
        "place": place ?? null,
        "payment": payment ?? null,
        "rate": rate ?? null,
        "available": available ?? null,
        "slug": slug ?? null,
        "ordernumber": ordernumber ?? null,
        "booked": booked ?? null,
        "created_at": createdAt ?? null,
        "valid_at": validAt == null
            ? null
            : "${validAt!.year.toString().padLeft(4, '0')}-${validAt!.month.toString().padLeft(2, '0')}-${validAt!.day.toString().padLeft(2, '0')}",
        "user": user ?? null,
        "booked_person": bookedPerson,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.categoryOf,
  });

  int? id;
  String? name;
  String? categoryOf;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        categoryOf: json["category_of"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "category_of": categoryOf ?? null,
      };
}

class City {
  City({
    this.id,
    this.city,
    this.district,
  });

  int? id;
  String? city;
  int? district;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] ?? null,
        city: json["city"] ?? null,
        district: json["district"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "city": city ?? null,
        "district": district ?? null,
      };
}

class District {
  District({
    this.id,
    this.district,
  });

  int? id;
  String? district;

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"] ?? null,
        district: json["district"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "district": district ?? null,
      };
}
