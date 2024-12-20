import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/src/constants/image_strings.dart';
import 'package:real_estate_management_platform/src/constants/sizes.dart';
import 'package:real_estate_management_platform/src/constants/text_strings.dart';
import 'package:real_estate_management_platform/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:real_estate_management_platform/src/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // children: [
              //   LoginHeaderWidget(),
              // LoginForm(),
              // LoginFooterWidget(),
              // ],
              children: [
                LoginHeaderWidget(size: size),
                const LoginForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20.0,
                        ),
                        onPressed: () {},
                        label: const Text(tSignInWithGoogle),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
