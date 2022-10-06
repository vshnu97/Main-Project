class SearchResponseModel {
  SearchResponseModel({
    this.results,
    this.message,
  });

  List<ResultX>? results;
  String? message;

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
        results: json["results"] == null
            ? null
            : List<ResultX>.from(json["results"].map((x) => ResultX.fromJson(x))),
      );
}

class ResultX {
  ResultX({
    this.id,
    this.category,
    this.district,
    this.city,
    this.title,
    this.discriptions,
    this.subMobile,
    this.mobile,
    this.address,
    this.place,
    this.image,
    this.image1,
    this.image2,
    this.payment,
    this.rate,
    this.priceIn,
    this.available,
    this.slug,
    this.ordernumber,
    this.booked,
    this.createdAt,
    this.validAt,
    this.user,
    this.bookedPerson,
  });

  int? id;
  Category? category;
  District? district;
  City? city;
  String? title;
  String? discriptions;
  String? subMobile;
  String? mobile;
  String? address;
  String? place;
  String? image;
  String? image1;
  String? image2;
  bool? payment;
  int? rate;
  String? priceIn;
  bool? available;
  String? slug;
  String? ordernumber;
  bool? booked;
  String? createdAt;
  DateTime? validAt;
  int? user;
  int? bookedPerson;

  factory ResultX.fromJson(Map<String, dynamic> json) => ResultX(
        id: json["id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        title: json["title"],
        discriptions:
            json["discriptions"],
        subMobile: json["sub_mobile"],
        mobile: json["mobile"],
        address: json["address"],
        place: json["place"],
        image: json["image"],
        image1: json["image1"],
        image2: json["image2"],
        payment: json["payment"],
        rate: json["rate"],
        priceIn: json["price_in"],
        available: json["available"],
        slug: json["slug"],
        ordernumber: json["ordernumber"],
        booked: json["booked"],
        createdAt: json["created_at"],
        validAt:
            json["valid_at"] == null ? null : DateTime.parse(json["valid_at"]),
        user: json["user"],
        bookedPerson:
            json["booked_person"],
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
        id: json["id"],
        name: json["name"],
        categoryOf: json["category_of"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_of": categoryOf,
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
        id: json["id"],
        city: json["city"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "district": district,
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
        id: json["id"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district": district,
      };
}
