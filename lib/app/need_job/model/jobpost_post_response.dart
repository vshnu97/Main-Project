
class PostJobResponseModel {
  PostJobResponseModel({
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

  factory PostJobResponseModel.fromJson(Map<String, dynamic> json) => PostJobResponseModel(
        id: json["id"] ?? '',
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        title: json["title"] ?? '',
        discriptions: json["discriptions"] ?? '',
        subMobile: json["sub_mobile"] ?? '',
        mobile: json["mobile"] ?? '',
        address: json["address"] ?? '',
        place: json["place"] ?? '',
        payment: json["payment"] ?? '',
        rate: json["rate"] ?? '',
        available: json["available"] ?? '',
        slug: json["slug"] ?? '',
        ordernumber: json["ordernumber"] ?? '',
        booked: json["booked"] ?? '',
        createdAt: json["created_at"] ?? '',
        validAt:
            json["valid_at"] == null ? null : DateTime.parse(json["valid_at"]),
        user: json["user"] ?? '',
        bookedPerson: json["booked_person"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "category": category == null ? null : category!.toJson(),
        "city": city == null ? null : city!.toJson(),
        "district": district == null ? null : district!.toJson(),
        "title": title ?? '',
        "discriptions": discriptions ?? '',
        "sub_mobile": subMobile ?? '',
        "mobile": mobile ?? '',
        "address": address ?? '',
        "place": place ?? '',
        "payment": payment ?? '',
        "rate": rate ?? '',
        "available": available ?? '',
        "slug": slug ?? '',
        "ordernumber": ordernumber ?? '',
        "booked": booked ?? '',
        "created_at": createdAt ?? '',
        "valid_at": validAt == null
            ? null
            : "${validAt!.year.toString().padLeft(4, '0')}-${validAt!.month.toString().padLeft(2, '0')}-${validAt!.day.toString().padLeft(2, '0')}",
        "user": user ?? '',
        "booked_person": bookedPerson,
      };
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
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        categoryOf: json["category_of"] ?? '',
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "name": name ?? '',
        "category_of": categoryOf ?? '',
        "image": image,
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
        id: json["id"] ?? '',
        city: json["city"] ?? '',
        district: json["district"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "city": city ?? '',
        "district": district ?? '',
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
        id: json["id"] ?? '',
        district: json["district"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "district": district ?? '',
      };
}
