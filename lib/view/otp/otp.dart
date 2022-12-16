import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/auth/otp.dart';
import 'package:shopi/model/otp.dart';
import 'package:shopi/model/sign_up/signup_model.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/login.dart';

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
    otpProvider.timeRemaining = 30;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          title: const Text(
            'OTP Verifiction',
            style: AppTextStyles.appBarTextStyle,
          ),
        ),
        body: Center(
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
                      style: AppTextStyles.textStyle3,
                    ),
                    Text(
                      widget.model.email!,
                      style: AppTextStyles.textStyle3,
                    ),
                    ksizedBox50,
                    Consumer<OtpScreenProvider>(builder: (context, values, _) {
                      return OtpTextField(
                        numberOfFields: 4,
                        showFieldAsBox: true,
                        fillColor: AppColors.lightDarkBackgroundColor,
                        filled: true,
                        fieldWidth: 70,
                        borderRadius: BorderRadius.circular(15),
                        autoFocus: true,
                        borderColor: AppColors.dullWhitecolor,
                        disabledBorderColor: AppColors.transparentColor,
                        enabledBorderColor: AppColors.darkShadeBackgroundColor,
                        cursorColor: AppColors.dullWhitecolor,
                        focusedBorderColor: AppColors.dullWhitecolor,
                        borderWidth: 1.5,
                        clearText: values.clear,
                        onSubmit: (String code) => values.setCode(code),
                      );
                    }),
                    ksizedBox20,
                    Consumer<OtpScreenProvider>(builder: (context, values, _) {
                      return values.timeRemaining != 0
                          ? Text('Resend code in ${values.timeRemaining}s')
                          : TextButton(
                              onPressed: () => values.setResendVisibility(
                                  true, context, widget.model.email!),
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            );
                    }),
                    ksizedBox50,
                    Consumer<OtpScreenProvider>(builder: (context, values, _) {
                      return values.loading == true
                          ? const LoadingWidget()
                          : CustomButtonOne(
                              text: 'Verify',
                              onTap: () => values.verifyCode(
                                  context, widget.model, widget.screenCheck),
                            );
                    }),
                  ],
                ),
              ),
            ),
          ),
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
