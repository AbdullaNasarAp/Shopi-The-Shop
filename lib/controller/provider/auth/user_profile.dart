import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopi/view/login/login.dart';

class LogoutController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  void logOut(BuildContext context) {
    storage.deleteAll();
    notifyListeners();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignInScreen(),
    ));
  }
}
