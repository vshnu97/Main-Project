class LendToolsPostModel {
  int district;
  int city;
  String title;
  int category;
  String subMobile;
  String description;
  String place;
  String address;
  String rate;
  String slug;
  String date;
  String priceIn;
  String image1;
  String image2;
  String image3;

  LendToolsPostModel(
      {required this.district,
      required this.city,
      required this.address,
      required this.category,
      required this.date,
      required this.description,
      required this.subMobile,
      required this.place,
      required this.rate,
      required this.slug,
      required this.title,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.priceIn});
}
