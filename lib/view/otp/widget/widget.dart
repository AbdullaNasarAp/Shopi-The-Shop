import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
            children: [
              const Text('Success!', style: AppTextStyles.textStyle2),
              ksizedBox10,
              const Text(
                  'You will be redirected to the\nHome page in a\nfew seconds',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle3),
              ksizedBox20,
              LoadingAnimationWidget.flickr(
                leftDotColor: kBlack,
                rightDotColor: Colors.grey,
                size: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
