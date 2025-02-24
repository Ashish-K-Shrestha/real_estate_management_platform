import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_management_platform/features/splash/presentation/view_model/splash_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the next screen (replace with your navigation logic)
      // ignore: use_build_context_synchronously
      context.read<SplashCubit>().init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00796B),
              Color(0xFF0288D1),
              Color(0xFFFFFFFF)
            ], // Teal, Blue, White
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), // Adjust opacity to blend
                BlendMode.modulate, // Blend the image with the background
              ),
              child: Image.asset(
                'assets/images/REM-Np.png',
                fit: BoxFit.contain, // Ensure the image is fully visible
              ),
            ),
          ),
        ),
      ),
    );
  }
}
