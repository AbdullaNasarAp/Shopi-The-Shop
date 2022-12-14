import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        ChangeNotifierProvider(
          create: (context) => SplashPro(),
        )
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
              fontFamily: "Inter",
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontFamily: "Inter",
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
