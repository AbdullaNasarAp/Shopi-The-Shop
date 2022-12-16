import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/new_password.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/login.dart';

class SuccessDialouge extends StatelessWidget {
  const SuccessDialouge({super.key});
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<NewPasswordProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newPasswordProvider.toSignInScreen(context);
    });
    return Dialog(
      backgroundColor: AppColors.transparentColor,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.welcomeScreenBgColor,
          ),
          width: 300,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              // Image(
              //   image: AssetImage(
              //       'assets/create_new_password_screen_assets/password_reset_success.png'),
              // ),
              Text('Success!', style: AppTextStyles.textStyle2),
              ksizedBox10,
              Text('You will be redirected to the\nHome page in a\nfew seconds',
                  textAlign: TextAlign.center, style: AppTextStyles.textStyle3),
              ksizedBox20,
              // LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
