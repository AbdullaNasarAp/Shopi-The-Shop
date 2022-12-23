import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/home/carousal.dart';
import 'package:shopi/utils/app_exception.dart';
import 'package:shopi/utils/interceptor.dart';

class CarouselService {
  Future<List<CarousalModel>?> getCarousel() async {
    Dio dios = await Interceptorapi().getApiUser();
    try {
      final Response response = await dios.get(
        ApiConstant.mainUrl + ApiEndPoints.carousal,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<CarousalModel> carousals = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();

        return carousals;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
