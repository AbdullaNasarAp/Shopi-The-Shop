import 'package:flutter/material.dart';
import 'package:shopi/model/whishlist.dart';
import 'package:shopi/service/wishlist.dart';
import 'package:shopi/service/wishlist/wishlist.dart';
import 'package:shopi/utils/app_snack.dart';
import 'package:shopi/utils/utils.dart';

class WishlistProvider with ChangeNotifier {
  WishlistProvider() {
    startLoading();
  }

  bool isLoading = false;
  WishListModel? wishList;
  List favorProduct = [];

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void getWishListItems() async {
    isLoading = true;
    notifyListeners();
    await WishListService().getWishListItems().then(
      (value) {
        if (value != null) {
          wishList = value;
          notifyListeners();
          favorProduct = wishList!.products.map((e) => e.product.id).toList();
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
        }
      },
    );
  }

  void addRemoveWishlistItem(String productID) async {
    isLoading = true;
    notifyListeners();
    await WishlistServices().addOrRemoveFromWishList(productID).then((value) {
      if (value != null) {
        WishlistServices().getWishListItems().then((value) {
          if (value != null) {
            wishList = value;
            notifyListeners();
            getWishListItems();
            isLoading = false;
            notifyListeners();
          } else {
            isLoading = false;
            notifyListeners();
          }
        });

        if (value == 201) {
          AppToast.showToast("Item Added to Wishlist", AppColors.greenColor);
        } else if (value == 204) {
          AppToast.showToast(
              "Item Removed from Wishlist", AppColors.greenColor);
        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
