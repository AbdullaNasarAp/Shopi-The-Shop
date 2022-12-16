import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/utils/app_exception.dart';

class ForgotPasswordService {
  final dio = Dio();
  Future<SignUpModel?> getUser(email) async {
    try {
      log('entered to get user');
      Response response = await dio.get(
        ApiConstant.mainUrl + ApiEndPoints.usercheck,
        queryParameters: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        log('got user');
        final SignUpModel model = SignUpModel.fromJson(response.data!);
        return model;
      } else if (response.statusCode == 201) {
        return null;
      }
    } catch (e) {
      log('entered get user catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> changePassword(email, newPassword) async {
    try {
      log('entered changepassword function');
      Response response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.forgetPassword,
        data: {
          'email': email,
          'password': newPassword,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 202) {
        log('Password changed successfull');
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
