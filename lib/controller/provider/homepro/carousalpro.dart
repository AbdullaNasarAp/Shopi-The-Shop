import 'package:flutter/cupertino.dart';
import 'package:shopi/model/home/carousal.dart';
import 'package:shopi/service/home/carousel.dart';

class CarousalProvider with ChangeNotifier {
  CarousalProvider() {
    callHomeFunctions();
  }

  List<CarousalModel> carousalList = [];

  bool loading = false;

  void callHomeFunctions() {
    getCarousals();
  }

  void getCarousals() async {
    loading = true;
    notifyListeners();
    await CarouselService().getCarousel().then((value) {
      if (value != null) {
        carousalList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }
}
