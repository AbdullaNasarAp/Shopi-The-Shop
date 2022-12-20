import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/user_profile.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: kWhite,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.asset(
                "assets/images/Fast Cart.png",
                height: 50,
                width: 50,
              ),
              const TextTitle(
                title: "Shopi.",
                ls: -2,
                colors: kBlack,
                fontwght: FontWeight.bold,
                fontsz: 28,
                textalign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.shoppingBag,
                    color: kBlack,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.search,
                    color: kBlack,
                  )),
            ],
          )
        ]),
        // actions: [
        //   Consumer<LogoutController>(
        //     builder: (context, value, child) {
        //       return IconButton(
        //           onPressed: () {
        //             value.logOut(context);
        //           },
        //           icon: Icon(
        //             Icons.logout,
        //             size: 20,
        //           ));
        //     },
        //   )
        // ],
      ),
      body: const Center(
        child: Text(
          "Home",
          style: TextStyle(color: kBlack, fontSize: 50),
        ),
      ),
    );
  }
}
