import 'package:flutter/cupertino.dart';
import 'package:shopi/model/home/category.dart';
import 'package:shopi/service/home/category.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];
  bool isLoading = false;
  CategoryProvider() {
    callFunction();
  }

  void callFunction() {
    getCategories();
  }

  void getCategories() async {
    isLoading = true;
    notifyListeners();
    await CategoryServices().getCategories().then((value) {
      if (value != null) {
        categoryList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        null;
      }
    });
  }
}
