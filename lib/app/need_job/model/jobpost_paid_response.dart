class JobPostPaidResponseModel {
  JobPostPaidResponseModel({
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
    this.message,
  });

  int? id;
  User? user;
  Category? category;
  City? city;
  District? district;
  dynamic bookedPerson;
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
  String? message;

  factory JobPostPaidResponseModel.fromJson(Map<String, dynamic> json) =>
      JobPostPaidResponseModel(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        bookedPerson: json["booked_person"],
        title: json["title"],
        discriptions: json["discriptions"],
        subMobile: json["sub_mobile"],
        mobile: json["mobile"],
        address: json["address"],
        place: json["place"],
        payment: json["payment"],
        rate: json["rate"],
        available: json["available"],
        slug: json["slug"],
        ordernumber: json["ordernumber"],
        booked: json["booked"],
        createdAt: json["created_at"],
        validAt:
            json["valid_at"] == null ? null : DateTime.parse(json["valid_at"]),
        verified: json["verified"],
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
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        email: json["email"],
        password: json["password"],
        isActive: json["is_active"],
        isAdmin: json["is_admin"],
        isStaff: json["is_staff"],
        count: json["count"],
        id: json["id"],
      );
}
