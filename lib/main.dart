import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/otp.dart';
import 'package:shopi/controller/provider/auth/signin.dart';
import 'package:shopi/controller/provider/auth/signup.dart';
import 'package:shopi/controller/provider/auth/user_profile.dart';
import 'package:shopi/controller/provider/homepro/carousalpro.dart';
import 'package:shopi/controller/provider/homepro/category.dart';
import 'package:shopi/controller/provider/homepro/productpro.dart';
import 'package:shopi/controller/provider/new_password.dart';
import 'package:shopi/controller/provider/splashnav.dart';
import 'package:shopi/view/splash/splash.dart';

void main() {
  runApp(
    const Shopi(),
  );
}

class Shopi extends StatelessWidget {
  const Shopi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashPro()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => OtpScreenProvider()),
        ChangeNotifierProvider(create: (context) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => LogoutController()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => CarousalProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: "Inter",
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
            ),
            subtitle2: TextStyle(
              fontFamily: "Inter",
              color: Colors.black,
            ),
          ),
        ),
        home: const SplashScreen1(),
      ),
    );
  }
}
