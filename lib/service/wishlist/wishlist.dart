import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/whishlist.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/interceptor.dart';

class WishlistServices {
  Future<int?> addOrRemoveFromWishList(String productId) async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.post(
        ApiConstant.mainUrl + ApiEndPoints.wishList,
        data: {'product': productId},
      );

      if (response.statusCode == 201) {
        return response.statusCode;
      } else if (response.statusCode == 204) {
        return response.statusCode;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }

    return null;
  }

  Future<WishListModel?> getWishListItems() async {
    final dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiConstant.mainUrl + ApiEndPoints.wishList);
      if (response.statusCode == 200) {
        final WishListModel model = WishListModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
