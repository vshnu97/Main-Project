class LendModelClass {
  final int category;
  final int city;
  final int district;
  final String title;
  final String description;
  final int subMobileNumber;
  final String place;
  final String address;
  final int rate;
  final String slug;
  final String priceIn;
  final String image1;
  final String image2;
  final String image3;

  LendModelClass({
    required this.category,
    required this.city,
    required this.district,
    required this.title,
    required this.description,
    required this.subMobileNumber,
    required this.place,
    required this.address,
    required this.rate,
    required this.slug,
    required this.priceIn,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  Map<String, dynamic> toJson() => {
        'district': district,
        'city': city,
        'title': title,
        'category': category,
        'discription': description,
        'sub_mobile': subMobileNumber,
        'place': place,
        'address': address,
        'rate': rate,
        'slug': slug,
        'image': image1,
        'image1': image2,
        'image2': image3,
        " price_in": priceIn,
      };
}
