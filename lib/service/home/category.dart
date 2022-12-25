import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/home/category.dart';
import 'package:shopi/model/home/product.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/interceptor.dart';

class CategoryServices {
  Future<List<CategoryModel>?> getCategories() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiConstant.mainUrl + ApiEndPoints.categories);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CategoryModel> category = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return category;
      }
    } on DioError catch (e) {
      log(e.message);
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<List<ProductModel>?> getProductByCategory(String categoryID) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
          '${ApiConstant.mainUrl + ApiEndPoints.product}?category=$categoryID');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ProductModel> products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return products;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
