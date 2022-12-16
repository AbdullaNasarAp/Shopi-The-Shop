import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopi/service/forgot_password.dart';
import 'package:shopi/view/login/login.dart';
import 'package:shopi/view/otp/widget/widget.dart';

class NewPasswordProvider with ChangeNotifier {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isVisible = false;
  bool loading = false;

  void visibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    } else if (value.length < 8) {
      return 'Password too short';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != newPasswordController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  void success(context, email) {
    loading = true;
    notifyListeners();
    ForgotPasswordService()
        .changePassword(email, newPasswordController.text)
        .then((value) {
      log(value.toString());
      if (value != null) {
        loading = false;
        notifyListeners();
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) {
            return const SuccessDialouge();
          },
        );
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void toSignInScreen(context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return SignInScreen();
      },
    ), (route) => false);
  }
}
