import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/sign_in/login_model.dart';
import 'package:shopi/model/sign_in/signin_token_model.dart';
import 'package:shopi/utils/app_exception.dart';

class ApiSignIn {
  final dio = Dio();
  Future<SignInModel?> login(LoginModel model) async {
    try {
      Response response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.login,
        queryParameters: ApiQueryParameter.queryParameter,
        data: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        final SignInModel model = SignInModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> googleSignIn(GoogleSignIn googleSignIn) async {
    try {
      final result = await googleSignIn.signIn();
      Response response = await dio
          .post(ApiConstant.mainUrl + ApiEndPoints.googleSignIn, data: {
        'email': result?.email,
        'name': result?.displayName,
      });
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return response.data['message'];
      }
    } catch (e) {
      log("entered catch of googlesignin");
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
