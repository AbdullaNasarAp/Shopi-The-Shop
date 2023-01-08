import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/user_profile.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/home/widget/applogo.dart';
import 'package:shopi/view/profile/profile.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ksizedBox50,
          const AppLogo(
            iHeight: 70,
            iWidth: 70,
            iFontsize: 40,
          ),
          ksizedBox50,
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Consumer<LogoutController>(
            builder: (context, value, child) {
              return DrawerTile(
                  string: "Profile",
                  iconData: FontAwesomeIcons.usersGear,
                  ontaptap: () {
                    Navigator.of(context).pushNamed(ProfileScreen.routeName);
                  });
            },
          )
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.string,
    required this.iconData,
    required this.ontaptap,
  });
  final String string;
  final IconData iconData;
  final VoidCallback ontaptap;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      onTap: ontaptap,
      icon: FaIcon(iconData, color: kIndigo),
      title: TextWithFamily(
          title: string,
          ls: 0,
          colors: kIndigo,
          fontwght: FontWeight.normal,
          fontsz: 17,
          textalign: TextAlign.center,
          maxline: 1,
          ws: 0),
    );
  }
}
