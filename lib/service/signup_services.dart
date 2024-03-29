// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:shopi/constant/apiconst.dart';
// import 'package:shopi/model/sign_up/sign_up_token_model.dart';
// import 'package:shopi/model/sign_up/signup_model.dart';
// import 'package:shopi/utils/app_exception.dart';

// class ApiSignUpServices {
//   final dio = Dio();

//   Future<SignUpTokenModel?> signUp(SignUpModel signUpModel, context) async {
//     try {
//       Response response =
//           await dio.post(ApiConstant.mainUrl + ApiEndPoints.signUp,
//               data: jsonEncode(
//                 signUpModel.toJson,
//               ),
//               queryParameters: ApiQueryParameter.queryParameter);

//       if (response.statusCode! >= 200 && response.statusCode! <= 299) {
//         final SignUpTokenModel model = SignUpTokenModel.fromJson(response.data);
//         return model;
//       }
//     } catch (e) {
//       AppExceptions.errorHandler(e);
//     }
//     return null;
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/model/sign_up/sign_up_token_model.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/utils/app_exception.dart';

class SignUpService {
  Dio dio = Dio();
  Future<SignUpTokenModel?> signUpService(
      SignUpModel model, BuildContext context) async {
    log(model.toString());
    try {
      log('call');
      Response response = await dio.post(
          ApiConstant.mainUrl + ApiEndPoints.signUp,
          data: json.encode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final SignUpTokenModel model = SignUpTokenModel.fromJson(response.data);
        return model;
        // return SignUpModel.fromJson(response.data);
      }
    } catch (e) {
      log("catch");
      // log(e.message);
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
