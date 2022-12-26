import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopi/model/otp.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/service/otp.dart';
import 'package:shopi/service/signup_services.dart';
import 'package:shopi/utils/app_snack.dart';
import 'package:shopi/view/home/home.dart';
import 'package:shopi/view/new_password/new_password.dart';

class OtpScreenProvider extends ChangeNotifier {
  int timeRemaining = 60;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  bool otpDone = false;
  String code = '';
  bool loading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void setResendVisibility(bool newValue, context, String email) {
    log('');
    clear = true;
    notifyListeners();
    OtpServices().sendOtp(email).then((value) {
      if (value != null) {
        clear = false;
        notifyListeners();
        enableResend = newValue;
        timeRemaining = 60;
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyCode(context, SignUpModel model, OtpScreenEnum screenChek) async {
    log('verifyOtpcodefun');
    if (code.length != 4) {
      AppToast.showToast('Please enter OTP', Colors.grey);
    } else {
      if (timeRemaining == 0) {
        AppToast.showToast('Otp timedout', Colors.grey);
      } else {
        loading = true;
        notifyListeners();
        if (screenChek == OtpScreenEnum.forgotOtpScreen) {
          await OtpServices().verifyOtp(model.email, code).then((value) {
            if (value != null) {
              Navigator.of(context)
                  .pushReplacement(
                MaterialPageRoute(
                  builder: (context) => NewPasswordScreen(model: model),
                ),
              )
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
          await OtpServices().verifyOtp(model.email, code).then((value) async {
            if (value != null) {
              await SignUpService()
                  .signUpService(model, context)
                  .then((value) async {
                if (value != null) {
                  await storage.write(key: 'token', value: value.accessToken);
                  await storage.write(
                      key: 'refreshToken', value: value.refreshToken);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                  loading = false;
                  notifyListeners();
                } else {
                  loading = false;
                  notifyListeners();
                }
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        }
      }
    }
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }
}
