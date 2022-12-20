import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/otp.dart';
import 'package:shopi/model/otp.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/login.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
    required this.model,
    required this.screenCheck,
  });

  final SignUpModel model;
  final OtpScreenEnum screenCheck;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late OtpScreenProvider otpProvider;
  @override
  void initState() {
    otpProvider = Provider.of<OtpScreenProvider>(context, listen: false);
    otpProvider.changeTimer();
    otpProvider.timeRemaining = 60;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kWhite,
          title: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: kBlack,
          ),
        ),
        backgroundColor: kWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TextTitle(
              title: "OTP Verification",
              ls: 0,
              colors: kBlack,
              fontwght: FontWeight.bold,
              fontsz: 22,
              textalign: TextAlign.left,
            ),
            Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Code has been sent to',
                          style: TextStyle(color: kBlack),
                        ),
                        Text(
                          widget.model.email!,
                          style: const TextStyle(color: kBlack),
                        ),
                        ksizedBox50,
                        Consumer<OtpScreenProvider>(
                            builder: (context, values, _) {
                          return OtpTextField(
                            numberOfFields: 4,
                            showFieldAsBox: true,
                            fillColor: kWhite,
                            filled: true,
                            fieldWidth: 70,
                            borderRadius: BorderRadius.circular(15),
                            autoFocus: true,
                            borderColor: AppColors.dullWhitecolor,
                            disabledBorderColor: AppColors.transparentColor,
                            enabledBorderColor:
                                AppColors.darkShadeBackgroundColor,
                            cursorColor: AppColors.dullWhitecolor,
                            focusedBorderColor: kBlack,
                            borderWidth: 1.5,
                            clearText: values.clear,
                            onSubmit: (String code) => values.setCode(code),
                          );
                        }),
                        ksizedBox20,
                        Consumer<OtpScreenProvider>(
                            builder: (context, values, _) {
                          return values.timeRemaining != 0
                              ? Text(
                                  'Resend code in ${values.timeRemaining}s',
                                  style: const TextStyle(
                                    color: kBlack,
                                  ),
                                )
                              : TextButton(
                                  onPressed: () => values.setResendVisibility(
                                      true, context, widget.model.email!),
                                  child: const Text(
                                    'Resend OTP',
                                    style: TextStyle(color: kBlack),
                                  ),
                                );
                        }),
                        ksizedBox50,
                        Consumer<OtpScreenProvider>(
                            builder: (context, values, _) {
                          return values.loading == true
                              ? const LoadingWidget()
                              : InkWell(
                                  onTap: () {
                                    values.verifyCode(context, widget.model,
                                        widget.screenCheck);
                                  },
                                  child: const ButtonContainer(
                                    kWidth: double.infinity,
                                    kHeight: 50,
                                    kColors: kBlack,
                                    colors: kWhite,
                                    title: "Verify",
                                    ls: 0,
                                    fontwght: FontWeight.bold,
                                    fontsz: 20,
                                    textalign: TextAlign.center,
                                    bRadius: 30,
                                  ),
                                );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpProvider.timer!.cancel();
    super.dispose();
  }
}
