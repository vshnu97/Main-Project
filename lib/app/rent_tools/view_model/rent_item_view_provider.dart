import 'package:flutter/cupertino.dart';

class RentItemViewProvider extends ChangeNotifier{
  int carouselIndex = 0;
  carouselSlider(index) {
    carouselIndex = index;
    notifyListeners();
    
  }
}