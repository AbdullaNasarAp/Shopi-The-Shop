import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/signup.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/login/widget/form.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignupProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      signUpProvider.clearController();
    });
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "logo",
                        child: Image.asset(
                          "assets/images/Fast Cart.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const Hero(
                        tag: "sign",
                        child: TextTitle(
                          title: "Sign Up",
                          ls: 0,
                          colors: kBlack,
                          fontwght: FontWeight.bold,
                          fontsz: 35,
                          textalign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ksizedBox50,
                  FormTextFormfield(
                    controller: signUpProvider.nameController,
                    keyboardType: TextInputType.name,
                    action: TextInputAction.next,
                    icon: Icons.person,
                    hint: 'Full name',
                    obscure: false,
                    validator: (value) => signUpProvider.nameValidation(value),
                  ),
                  ksizedBox20,
                  FormTextFormfield(
                    controller: signUpProvider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    icon: Icons.mail,
                    hint: 'Email',
                    obscure: false,
                    validator: (value) => signUpProvider.emailValidation(value),
                  ),
                  ksizedBox20,
                  FormTextFormfield(
                    controller: signUpProvider.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    action: TextInputAction.next,
                    icon: Icons.numbers,
                    hint: 'Mobile number',
                    obscure: false,
                    validator: (value) =>
                        signUpProvider.phoneNumberValidation(value),
                  ),
                  ksizedBox20,
                  Consumer<SignupProvider>(builder: (context, values, _) {
                    return FormTextFormfield(
                      controller: signUpProvider.passwordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.next,
                      icon: Icons.lock,
                      hint: 'Password',
                      obscure: values.isNotVisible,
                      validator: (value) =>
                          signUpProvider.passwordValidation(value),
                      suffixIcon: values.isNotVisible == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffixOntap: () => signUpProvider.passwordHide(),
                    );
                  }),
                  ksizedBox20,
                  Consumer<SignupProvider>(builder: (context, values, _) {
                    return FormTextFormfield(
                      controller: signUpProvider.confirmPasswordController,
                      keyboardType: TextInputType.text,
                      action: TextInputAction.done,
                      icon: Icons.lock,
                      hint: 'Confirm password',
                      obscure: false,
                      validator: (value) =>
                          signUpProvider.confirmPasswordValidation(value),
                    );
                  }),
                  ksizedBox20,
                  Consumer<SignupProvider>(
                    builder: (context, value, child) {
                      return value.isLoading == true
                          ? LoadingAnimationWidget.flickr(
                              leftDotColor: kBlack,
                              rightDotColor: Colors.grey,
                              size: 50,
                            )
                          : InkWell(
                              onTap: () => value.toSignUpOtpScreen(
                                  context, formKey.currentState!),
                              child: const ButtonContainer(
                                kWidth: double.infinity,
                                kHeight: 60,
                                kColors: kBlack,
                                colors: kWhite,
                                title: "Sign Up",
                                ls: 0,
                                fontwght: FontWeight.bold,
                                fontsz: 22,
                                textalign: TextAlign.center,
                                bRadius: 15,
                              ),
                            );
                    },
                  ),
                  ksizedBox50,
                  Column(
                    children: [
                      const TextTitle(
                        title: "You are completely safe.Read our",
                        ls: 0,
                        colors: kBlack,
                        fontwght: FontWeight.w300,
                        fontsz: 15,
                        textalign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const TextTitle(
                          title: " Terms & Conditions.",
                          ls: 0,
                          colors: Colors.blue,
                          fontwght: FontWeight.bold,
                          fontsz: 15,
                          textalign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
