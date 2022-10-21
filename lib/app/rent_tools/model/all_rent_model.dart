class RentAllResponseModel {
  List<RentAll>? listAllrents;
  String? message;
  RentAllResponseModel({
    this.listAllrents,
    this.message,
  });
  factory RentAllResponseModel.fromJson(List<dynamic> parsedJson) {
    return RentAllResponseModel(
      listAllrents: parsedJson == []
          ? []
          : parsedJson.map((i) => RentAll.fromJson(i)).toList(),
    );
  }
}



class RentAll {
  RentAll({
    this.id,
    this.user,
    this.category,
    this.district,
    this.city,
    this.bookedPerson,
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
    this.itemBacked,
  });

  int? id;
  BookedPerson? user;
  Category? category;
  District? district;
  City? city;
  BookedPerson? bookedPerson;
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
  bool? itemBacked;

  factory RentAll.fromJson(Map<String, dynamic> json) => RentAll(
        id: json["id"] ?? null,
        user: json["user"] == null ? null : BookedPerson.fromJson(json["user"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        bookedPerson: json["booked_person"] == null
            ? null
            : BookedPerson.fromJson(json["booked_person"]),
        title: json["title"] ?? null,
        discriptions:
            json["discriptions"] ?? null,
        subMobile: json["sub_mobile"] ?? null,
        mobile: json["mobile"] ?? null,
        address: json["address"] ?? null,
        place: json["place"] ?? null,
        image: json["image"] ?? null,
        image1: json["image1"] ?? null,
        image2: json["image2"] ?? null,
        payment: json["payment"] ?? null,
        rate: json["rate"] ?? null,
        priceIn: json["price_in"] ?? null,
        available: json["available"] ?? null,
        slug: json["slug"] ?? null,
        ordernumber: json["ordernumber"] ?? null,
        booked: json["booked"] ?? null,
        createdAt: json["created_at"] ?? null,
        validAt:
            json["valid_at"] == null ? null : DateTime.parse(json["valid_at"]),
        itemBacked: json["item_backed"] ?? null,
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
