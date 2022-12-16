import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopi/model/otp.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/service/forgot_password.dart';
import 'package:shopi/service/otp.dart';
import 'package:shopi/utils/app_snack.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/otp/otp.dart';

class SignupProvider with ChangeNotifier {
  signupProviders() {
    clearController();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isNotVisible = true;
  bool isLoading = false;

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Name';
    } else {
      return null;
    }
  }

  String? phoneNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Phone Number';
    } else if (value.length != 10) {
      return 'Phone Number must be 10 digits';
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Short password';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != passwordController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void passwordHide() {
    isNotVisible = !isNotVisible;
    notifyListeners();
  }

  void toSignUpOtpScreen(context, FormState currentState) async {
    final SignUpModel model = SignUpModel(
      fullname: nameController.text,
      email: emailController.text,
      number: phoneNumberController.text,
      password: passwordController.text,
    );
    final args = OtpArguementModel(
        model: model, checkScreen: OtpScreenEnum.signUpOtpScreen);
    if (currentState.validate()) {
      isLoading = true;
      notifyListeners();
      await ForgotPasswordService()
          .getUser(emailController.text)
          .then((value) async {
        if (value == null) {
          await OtpServices().sendOtp(emailController.text).then((value) {
            log(value.toString());
            if (value != null) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return OTPScreen(
                    model: model,
                    screenCheck: OtpScreenEnum.signUpOtpScreen,
                  );
                },
              )).then((value) {
                isLoading = false;
                notifyListeners();
              });
            } else {
              return null;
            }
          });
        } else {
          AppToast.showToast('User already exists', AppColors.redColor);
        }
      });
      isLoading = false;
      notifyListeners();
    }
  }

  void clearController() {
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isNotVisible = true;
  }
}
