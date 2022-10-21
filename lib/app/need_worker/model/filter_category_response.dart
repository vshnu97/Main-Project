class CategoryJobResponse {
  List<FilterOnJobCateResponseModel>? listFilteredData;
  String? message;
  CategoryJobResponse({
    this.listFilteredData,
    this.message,
  });
  factory CategoryJobResponse.fromJson(List<dynamic> parsedJson) {
    return CategoryJobResponse(
      listFilteredData: parsedJson == []
          ? []
          : parsedJson
              .map((i) => FilterOnJobCateResponseModel.fromJson(i))
              .toList(),
    );
  }
}

class FilterOnJobCateResponseModel {
  FilterOnJobCateResponseModel({
    this.id,
    this.user,
    this.category,
    this.city,
    this.district,
    this.bookedPerson,
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
    this.verified,
  });

  int? id;
  BookedPerson? user;
  Category? category;
  City? city;
  District? district;
  BookedPerson? bookedPerson;
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
  bool? verified;

  factory FilterOnJobCateResponseModel.fromJson(Map<String, dynamic> json) =>
      FilterOnJobCateResponseModel(
        id: json["id"] ?? null,
        user: json["user"] == null ? null : BookedPerson.fromJson(json["user"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        bookedPerson: json["booked_person"] == null
            ? null
            : BookedPerson.fromJson(json["booked_person"]),
        title: json["title"] ?? null,
        discriptions: json["discriptions"] ?? null,
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
        verified: json["verified"] ?? null,
      );
}

class BookedPerson {
  BookedPerson({
    this.firstName,
    this.lastName,
    this.mobile,
    this.email,
    this.password,
    this.isActive,
    this.isAdmin,
    this.isStaff,
    this.count,
    this.id,
  });

  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? password;
  bool? isActive;
  bool? isAdmin;
  bool? isStaff;
  int? count;
  int? id;

  factory BookedPerson.fromJson(Map<String, dynamic> json) => BookedPerson(
        firstName: json["first_name"] ?? null,
        lastName: json["last_name"] ?? null,
        mobile: json["mobile"] ?? null,
        email: json["email"] ?? null,
        password: json["password"] ?? null,
        isActive: json["is_active"] ?? null,
        isAdmin: json["is_admin"] ?? null,
        isStaff: json["is_staff"] ?? null,
        count: json["count"] ?? null,
        id: json["id"] ?? null,
      );
}

class Category {
  Category({
    this.id,
    this.name,
    this.categoryOf,
    this.image,
  });

  int? id;
  String? name;
  String? categoryOf;
  dynamic? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        categoryOf: json["category_of"] ?? null,
        image: json["image"],
      );
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
}
