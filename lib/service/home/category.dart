import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/home/category.dart';
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
}
