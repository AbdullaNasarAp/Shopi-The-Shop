import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopi/view/home/home.dart';
import 'package:shopi/view/login/login.dart';

class SplashPro with ChangeNotifier {
  // void navigatorSplash1(BuildContext context) {
  //   Timer(const Duration(seconds: 3), () {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => SignInScreen(),
  //     ));
  //   });
  //   notifyListeners();
  // }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? signInstate;
  void checkLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    signInstate = await storage.read(key: 'token');
    log(signInstate.toString());
    if (signInstate != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
          (route) => false);
    }
  }
}
