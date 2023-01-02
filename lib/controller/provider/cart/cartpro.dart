import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shopi/model/cart/cart_model.dart';
import 'package:shopi/service/cartservice.dart';
import 'package:shopi/utils/app_snack.dart';
import 'package:shopi/utils/utils.dart';

class CartProvider with ChangeNotifier {
  CartProvider() {
    startLoading();
  }
  CartModel? cartList;
  bool loading = false;
  int quantity = 1;
  List<String> cartItemsId = [];
  List<String> cartitemsPayId = [];
  int? totalSave;
  int? totalProductCount;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void getCartItems() async {
    loading = true;
    notifyListeners();
    await CartService().getCartItems().then((value) {
      if (value != null) {
        log("please kayaru");
        cartList = value;
        notifyListeners();
        totalProductsCount();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        cartitemsPayId = cartList!.products.map((e) => e.id).toList();
        totalSave =
            cartList!.totalDiscount.toInt() - cartList!.totalPrice.toInt();
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> addToCart(String productId, String? productSize,
      OrderSummaryScreenEnum? screenCheck) async {
    if (productSize == null) {
      log("padchone ingal katholi");
      AppToast.showToast('Select size', AppColors.redColor);
    } else {
      log("ahh rakshpett");
      final AddToCartModel model = AddToCartModel(
        productId: productId,
        quantity: quantity,
        size: productSize.toString(),
      );
      await CartService().addToCart(model).then((value) {
        log("pinneyum rakshapett");
        if (value != null) {
          getCartItems();
          if (value == 'product added to cart successfully') {
            screenCheck !=
                    OrderSummaryScreenEnum.buyOneProductOrderSummaryScreen
                ? AppToast.showToast(
                    'Product added to cart',
                    AppColors.greenColor,
                  )
                : null;
          } else {
            null;
          }
        } else {
          null;
        }
      });
    }
  }

  void totalProductsCount() {
    int count = 0;
    for (var i = 0; i < cartList!.products.length; i++) {
      count = count + cartList!.products[i].qty;
    }
    totalProductCount = count;
    notifyListeners();
  }

  totalSaved(dynamic totalPrice, dynamic totalDiscount) {
    dynamic totalSave = totalPrice ?? 0 - totalDiscount ?? 0;
    return totalSave;
  }

  void removeFromCart(String productId) async {
    loading = true;
    notifyListeners();
    await CartService().removeFromCart(productId).then((value) {
      if (value != null) {
        getCartItems();
        AppToast.showToast('Item removed from cart', AppColors.greenColor);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  Future<void> incrementOrDecrementQuantity(int qty, String productId,
      String productSize, int productquantity) async {
    final AddToCartModel model = AddToCartModel(
      productId: productId,
      quantity: qty,
      size: productSize.toString(),
    );
    if (qty == 1 && productquantity >= 1 || qty == -1 && productquantity > 1) {
      await CartService().addToCart(model).then((value) async {
        if (value != null) {
          await CartService().getCartItems().then((value) {
            if (value != null) {
              cartList = value;
              notifyListeners();
              totalProductsCount();
              cartItemsId =
                  cartList!.products.map((e) => e.product.id).toList();
              notifyListeners();
              totalSave = cartList!.totalDiscount.toInt() -
                  cartList!.totalPrice.toInt();
              notifyListeners();
            } else {
              null;
            }
          });
        } else {
          null;
        }
      });
    } else {
      null;
    }
  }

  // void toAddressScreen(
  //   BuildContext context,
  //   OrderSummaryScreenEnum orderScreenCheck,
  //   String? cartId,
  //   String? productId,
  // ) {
  //   final args = AddressScreenArguementModel(
  //     screenCheck: orderScreenCheck,
  //     cartId: cartId,
  //     productId: productId,
  //     visibility: true,
  //   );
  //   Navigator.of(context).pushNamed(
  //     RouteNames.addressScreen,
  //     arguments: args,
  //   );
  // }
}

enum OrderSummaryScreenEnum {
  normalOrderSummaryScreen,
  buyOneProductOrderSummaryScreen,
}
