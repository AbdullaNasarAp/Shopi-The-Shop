import 'package:flutter/material.dart';
import 'package:shopi/controller/constant/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(
                child: TextTitle(
                  textalign: TextAlign.center,
                  title: "Sign in",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 38,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  elevation: 20,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: const Text("Email"),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  elevation: 20,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      label: const Text("Password"),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              const TextTitle(
                textalign: TextAlign.end,
                title: "Forgot Password ?",
                ls: 0,
                colors: kBlack,
                fontwght: FontWeight.w300,
                fontsz: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
