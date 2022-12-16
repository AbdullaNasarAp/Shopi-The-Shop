import 'package:shopi/model/sign_up/signup_model.dart';

class OtpArguementModel {
  final SignUpModel model;
  final OtpScreenEnum checkScreen;
  OtpArguementModel({
    required this.model,
    required this.checkScreen,
  });
}

enum OtpScreenEnum {
  forgotOtpScreen,
  signUpOtpScreen,
}
