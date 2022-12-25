import 'package:flutter/cupertino.dart';

import 'package:shopi/model/home/category.dart';
import 'package:shopi/model/home/product.dart';
import 'package:shopi/service/home/category.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];

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

  // void getProductByCategiory(String categoryID) async {
  //   isLoading = true;
  //   notifyListeners();
  //   await CategoryServices().getProductByCategory(categoryID).then((value) {
  //     if (value != null) {
  //       productList = value;
  //       notifyListeners();
  //       isLoading = false;
  //       notifyListeners();
  //     } else {
  //       isLoading = false;
  //       notifyListeners();
  //       null;
  //     }
  //   });
  // }

  // void category(int index, BuildContext context) {
  //   if (!_loadingInitData) {
  //     displaypro = availableMeals.where((prod) {
  //       return prod.category.contains(
  //           Provider.of<ProductProvider>(context).productList[index].id);
  //     }).toList();
  //     _loadingInitData = true;
  //   }
  // }
}
