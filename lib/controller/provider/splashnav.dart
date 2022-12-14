import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopi/view/lest_start/lets_start.dart';
import 'package:shopi/view/splash2/splash2.dart';

class SplashPro with ChangeNotifier {
  void navigatorSplash(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SplashScreen2(),
      ));
    });
    notifyListeners();
  }

  void navigatorSplash1(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LetsStart(),
      ));
    });
    notifyListeners();
  }
}
