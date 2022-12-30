import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/home/product.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/interceptor.dart';

class ProductService {
  Future<List<ProductModel>?> getProducts() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response =
          await dios.get(ApiConstant.mainUrl + ApiEndPoints.product);
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

  Future<ProductModel?> getAProduct(String productId) async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios
          .get('${ApiConstant.mainUrl + ApiEndPoints.product}/$productId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final ProductModel product = ProductModel.fromJson(response.data);
        return product;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
