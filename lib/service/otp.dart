import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/utils/app_exception.dart';

class OtpServices {
  Dio dio = Dio();
  Future<String?> verifyOtp(email, otpNumber) async {
    try {
      log('verifyOtp');
      Response response = await dio.post(
        ApiConstant.mainUrl + ApiEndPoints.verifyOrSendOtp,
        data: {
          'otp': otpNumber,
          'email': email,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> sendOtp(email) async {
    try {
      log('sendOtp');
      Response response = await dio.get(
        ApiConstant.mainUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
