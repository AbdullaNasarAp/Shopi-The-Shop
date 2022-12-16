import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/new_password.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/login.dart';
import 'package:shopi/view/login/widget/form.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({
    super.key,
    required this.model,
  });
  final SignUpModel model;
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<NewPasswordProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          title: const Text(
            'Create New Password',
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text("Success !")
                      //  Image(
                      //   image: AssetImage(
                      //       'assets/create_new_password_screen_assets/create_new_password.png'),
                      // ),
                      ),
                  ksizedBox20,
                  Consumer<NewPasswordProvider>(builder: (context, values, _) {
                    return FormTextFormfield(
                      controller: values.newPasswordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      icon: Icons.lock,
                      hint: 'New Password',
                      obscure: values.isVisible == false ? true : false,
                      validator: (value) => values.passwordValidation(value),
                      suffixIcon: values.isVisible == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixOntap: () => values.visibility(),
                    );
                  }),
                  ksizedBox20,
                  FormTextFormfield(
                    controller: newPasswordProvider.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    action: TextInputAction.done,
                    icon: Icons.lock,
                    hint: 'Confirm password',
                    obscure: false,
                    validator: (value) =>
                        newPasswordProvider.confirmPasswordValidation(value),
                  ),
                  ksizedBox50,
                  Consumer<NewPasswordProvider>(builder: (context, values, _) {
                    return values.loading == true
                        ? const LoadingWidget()
                        : CustomButtonOne(
                            text: 'Continue',
                            onTap: () => values.success(
                              context,
                              model.email,
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
