import 'package:flutter/material.dart';
import 'package:shopi/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          "Home",
          style: TextStyle(color: kBlack, fontSize: 50),
        ),
      ),
    );
  }
}
