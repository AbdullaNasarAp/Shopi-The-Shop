import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/user_profile.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/home/widget/applogo.dart';

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
              return IconButton(
                  onPressed: () {
                    value.logOut(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: kBlack,
                    size: 20,
                  ));
            },
          )
        ],
      ),
    );
  }
}
