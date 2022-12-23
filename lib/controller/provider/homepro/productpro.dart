import 'package:flutter/material.dart';
import 'package:shopi/model/home/product.dart';
import 'package:shopi/service/home/product.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];
  bool isLoading = false;
  ProductProvider() {
    callFunction();
  }

  void callFunction() {
    getProducts();
  }

  void getProducts() async {
    isLoading = true;
    notifyListeners();
    await ProductService().getProducts().then((value) {
      if (value != null) {
        productList = value;
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
