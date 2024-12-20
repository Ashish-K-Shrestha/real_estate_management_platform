import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/src/constants/colors.dart';
import 'package:real_estate_management_platform/src/constants/image_strings.dart';
import 'package:real_estate_management_platform/src/constants/sizes.dart';
import 'package:real_estate_management_platform/src/constants/text_strings.dart';
import 'package:real_estate_management_platform/src/features/authentication/screens/login/login_screen.dart';
import 'package:real_estate_management_platform/src/features/authentication/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: const AssetImage(tWelcomeScreenImage),
              height: height * 0.6),
          Column(
            children: [
              Text(
                tWelcomeTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                tWelcomeSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    foregroundColor: tSecondaryColor,
                    backgroundColor: const Color.fromARGB(255, 92, 196, 96),
                    side: const BorderSide(color: tSecondaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                  child: Text(tLogin.toUpperCase()),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    foregroundColor: tSecondaryColor,
                    backgroundColor: const Color.fromARGB(255, 52, 119, 219),
                    side: const BorderSide(color: tSecondaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: tButtonHeight),
                  ),
                  child: Text(tSignup.toUpperCase()),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
