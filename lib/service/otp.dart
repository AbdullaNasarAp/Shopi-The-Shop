import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/utils/app_exception.dart';

class OtpServices {
  final dio = Dio();
  Future<String?> verifyOtp(email, otpNumber) async {
    try {
      Response response =
          await dio.post(ApiConstant.mainUrl + ApiEndPoints.verifyOrSendOtp,
              data: {
                'otp': otpNumber,
                'email': email,
              },
              queryParameters: ApiQueryParameter.queryParameter);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> sendOtp(email) async {
    log(email);
    try {
      log("send otp");
      Response response = await dio.get(
          ApiConstant.mainUrl + ApiEndPoints.verifyOrSendOtp,
          queryParameters: {
            'email': email,
          });
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('send');
        log(response.statusCode.toString());
        return response.data['message'];
      }
    } catch (e) {
      log('catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
