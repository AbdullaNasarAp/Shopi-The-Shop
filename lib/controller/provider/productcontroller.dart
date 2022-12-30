import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopi/model/home/product.dart';
import 'package:shopi/service/home/product.dart';

class ProductProviderpro with ChangeNotifier {
  ProductProviderpro() {
    loadingStart();
  }
  int? sizeChartIndex;
  bool loading = false;
  ProductModel? product;
  String? productId;
  String? productSize;

  // void toAddressScreen(context, OrderSummaryScreenEnum orderScreenCheck,
  //     String? cartId, String? productId) {
  //   final args = AddressScreenArguementModel(
  //     screenCheck: orderScreenCheck,
  //     cartId: cartId,
  //     productId: productId,
  //     visibility: true,
  //   );
  //   if (productSize != null) {
  //     Navigator.of(context).pushNamed(
  //       RouteNames.addressScreen,
  //       arguments: args,
  //     );
  //   } else {
  //     return;
  //   }
  // }

  void sizeSelect(int index) {
    log("chelakkand vanno");
    sizeChartIndex = index;
    notifyListeners();
    productSize = product?.size[index].toString();
    notifyListeners();
  }

  void getAProduct() async {
    loading = true;
    notifyListeners();
    await ProductService().getAProduct(productId!).then((value) {
      if (value != null) {
        sizeChartIndex = null;
        notifyListeners();
        product = value;
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

  void loadingStart() {
    loading = true;
    notifyListeners();
  }
}
