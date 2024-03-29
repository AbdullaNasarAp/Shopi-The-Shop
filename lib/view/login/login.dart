import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/signin.dart';
import 'package:shopi/utils/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/login/widget/button_image.dart';
import 'package:shopi/view/login/widget/form.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: kWhite,
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "logo",
                          child: Image.asset(
                            "assets/images/Fast Cart.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const TextTitle(
                          title: "Login",
                          ls: 0,
                          colors: kBlack,
                          fontwght: FontWeight.bold,
                          fontsz: 35,
                          textalign: TextAlign.center,
                          maxline: 1,
                        ),
                      ],
                    ),
                    ksizedBox50,
                    FormTextFormfield(
                      controller: signInProvider.emailController,
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.next,
                      icon: Icons.mail,
                      hint: 'Email',
                      obscure: false,
                      validator: (value) =>
                          signInProvider.emailValidation(value),
                    ),
                    ksizedBox10,
                    Consumer<SignInProvider>(builder: (context, values, _) {
                      return FormTextFormfield(
                        controller: signInProvider.passwordController,
                        keyboardType: TextInputType.text,
                        action: TextInputAction.next,
                        icon: Icons.lock,
                        hint: 'Password',
                        obscure: values.isNotVisible,
                        validator: (value) =>
                            signInProvider.passwordValidation(value),
                        suffixIcon: values.isNotVisible == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixOntap: () => signInProvider.passwordHide(),
                      );
                    }),
                    ksizedBox20,
                    Consumer<SignInProvider>(builder: (context, values, _) {
                      return values.isloading == true
                          ? LoadingAnimationWidget.flickr(
                              leftDotColor: kBlack,
                              rightDotColor: Colors.grey,
                              size: 50,
                            )
                          : InkWell(
                              onTap: () =>
                                  values.login(context, formKey.currentState!),
                              child: const ButtonContainer(
                                title: "Login",
                                textalign: TextAlign.center,
                                ls: 0,
                                bRadius: 20,
                                colors: kWhite,
                                fontsz: 16,
                                fontwght: FontWeight.w300,
                                kColors: kBlack,
                                kHeight: 60,
                                kWidth: double.infinity,
                              ),
                            );
                    }),
                    ksizedBox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () =>
                              signInProvider.toForgotPasswordScreen(context),
                          child: const TextTitle(
                            title: "Forgot Password ?",
                            ls: 0,
                            colors: kBlue,
                            fontwght: FontWeight.w300,
                            fontsz: 15,
                            textalign: TextAlign.center,
                            maxline: 1,
                          ),
                        ),
                      ],
                    ),
                    ksizedBox50,
                    Row(
                      children: const [
                        Expanded(
                            child: Divider(
                          thickness: 0.4,
                          color: kBlack,
                        )),
                        ksizedBox10,
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextTitle(
                            title: "Or continue with",
                            ls: 0,
                            colors: kBlack,
                            fontwght: FontWeight.w300,
                            fontsz: 15,
                            textalign: TextAlign.center,
                            maxline: 1,
                          ),
                        ),
                        ksizedBox10,
                        Expanded(
                            child: Divider(
                          thickness: 0.4,
                          color: kBlack,
                        ))
                      ],
                    ),
                    ksizedBox20,
                    Center(
                        child: InkWell(
                      onTap: () => signInProvider.googleSignin(context),
                      child: const ButtonImage(
                        colors: kBlack,
                        fontsz: 16,
                        fontwght: FontWeight.w300,
                        ls: 0,
                        textAlign: TextAlign.center,
                        title: "Sign In With Google",
                        image: "assets/images/icons8-google-480.png",
                      ),
                    )),
                    ksizedBox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextTitle(
                          title: "Don't have an account",
                          ls: 0,
                          colors: kBlack,
                          fontwght: FontWeight.w300,
                          fontsz: 15,
                          textalign: TextAlign.center,
                          maxline: 1,
                        ),
                        TextButton(
                          onPressed: () =>
                              signInProvider.toSignUpScreen(context),
                          child: const Hero(
                            tag: "sign",
                            child: TextTitle(
                              title: "Sign Up",
                              ls: 0,
                              colors: Colors.blue,
                              fontwght: FontWeight.bold,
                              fontsz: 15,
                              textalign: TextAlign.center,
                              maxline: 1,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextStyles {
  static const textStyle1 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 35,
    fontWeight: FontWeight.w600,
  );
  static const appBarTextStyle =
      TextStyle(color: AppColors.whiteColor, fontSize: 25);
  static const textStyle2 =
      TextStyle(color: AppColors.whiteColor, fontSize: 35);
  static const textStyle3 =
      TextStyle(fontSize: 18, color: AppColors.whiteColor);
  static const textStyle4 =
      TextStyle(fontSize: 18, color: AppColors.whiteColor);
  static const textstyle5 = TextStyle(
      fontSize: 12, color: AppColors.blackcolor, fontWeight: FontWeight.bold);
  static const customButtonTextStyle = TextStyle(
      color: AppColors.blackcolor, fontSize: 16, fontWeight: FontWeight.bold);
}

class CustomButtonThree extends StatelessWidget {
  const CustomButtonThree({
    super.key,
    required this.onTap,
    required this.imagePath,
  });
  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.lightDarkBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Image(
            height: 25,
            width: 25,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}

class CustomButtonOne extends StatelessWidget {
  const CustomButtonOne({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.customButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.whiteColor,
        size: 35,
        secondRingColor: AppColors.dullWhitecolor,
        thirdRingColor: AppColors.dullWhitecolor,
      ),
    );
  }
}
