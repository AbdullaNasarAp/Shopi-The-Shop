import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/interceptor.dart';

import '../model/cart/cart_model.dart';

class CartService {
  Future<CartModel?> getCartItems() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiConstant.mainUrl + ApiEndPoints.cart);

      if (response.statusCode == 200) {
        log("onn vaado");
        final model = CartModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      log("ivde keraruth");
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> addToCart(AddToCartModel model) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
          ApiConstant.mainUrl + ApiEndPoints.cart,
          data: jsonEncode(model.toJson()));
      if (response.statusCode == 201) {
        log("please come here ");
        final String resp = response.data['message'];
        return resp;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> removeFromCart(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.patch(
        ApiConstant.mainUrl + ApiEndPoints.cart,
        data: {'product': productId},
      );
      if (response.statusCode == 201) {
        final String resp = response.data['message'];
        log(response.data.toString());
        return resp;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  // Future<List<GetSingelCartProduct>?> getSingleCartProduct(
  //     String productId, String cartId) async {
  //   Dio dios = await Interceptorapi().getApiUser();
  //   try {
  //     final Response response = await dios.get(
  //         '${ApiConstant.mainUrl + ApiEndPoints.cart}/$cartId/product/$productId');
  //     if (response.statusCode == 200) {
  //       final List<GetSingelCartProduct> product = (response.data as List)
  //           .map((e) => GetSingelCartProduct.fromJson(e))
  //           .toList();
  //       return product;
  //     }
  //   } catch (e) {
  //     AppExceptions.errorHandler(e);
  //   }
  //   return null;
  // }
}
