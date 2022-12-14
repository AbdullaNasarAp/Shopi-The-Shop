import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopi/view/login/login.dart';

class SplashPro with ChangeNotifier {
  void navigatorSplash1(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    });
    notifyListeners();
  }
}
