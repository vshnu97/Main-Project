class JobPostModel {
  int district;
  int city;
  String title;
  int category;
  String mobile;
  String description;
  String place;
  String address;
  String rate;
  String slug;
  String date;
  JobPostModel({
    required this.district,
    required this.city,
    required this.address,
    required this.category,
    required this.date,
    required this.description,
    required this.mobile,
    required this.place,
    required this.rate,
    required this.slug,
    required this.title,
  });
  Map<String, dynamic> toJson() => {
        "district": district,
        "city": city,
        "title": title,
        "category": category,
        "discription": description,
        "sub_mobile": mobile,
        'place': place,
        'address': address,
        'rate': rate,
        'slug': slug,
        'date': date
      };
}
