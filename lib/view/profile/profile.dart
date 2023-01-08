import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/address/address.dart';
import 'package:shopi/view/home/widget/drawer.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWithFamily(
          title: "Profile",
          ls: 0,
          colors: kIndigo,
          fontwght: FontWeight.bold,
          fontsz: 18,
          textalign: TextAlign.center,
          maxline: 1,
          ws: 0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWithFamily(
                title: "Account Settings",
                ls: 0,
                colors: kIndigo,
                fontwght: FontWeight.normal,
                fontsz: 16,
                textalign: TextAlign.center,
                maxline: 1,
                ws: 0,
              ),
              ksizedBox10,
              DrawerTile(
                string: "Add Address",
                iconData: FontAwesomeIcons.solidAddressBook,
                ontaptap: () {
                  Navigator.of(context).pushNamed(AddressScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
