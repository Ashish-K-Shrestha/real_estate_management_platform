import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_management_platform/features/onboarding/presentation/view/on_board_model.dart';
import 'package:real_estate_management_platform/features/onboarding/presentation/view_model/onboarding_cubit.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0074B7),
                Color(0xFF00A99D)
              ], // Blue & Teal gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentPage) {
                    final cubit = context.read<OnboardingCubit>();
                    return PageView.builder(
                      controller: cubit.pageController,
                      onPageChanged: cubit.emit,
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        final page = pages[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Image.asset(
                                  page.imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                page.title,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  page.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              // Dots Indicator
              BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: currentPage == index ? 12.0 : 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentPage) {
                    final cubit = context.read<OnboardingCubit>();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentPage != 0)
                          TextButton(
                            onPressed: () =>
                                cubit.navigateToAuthScreen(context),
                            child: const Text(
                              'Skip',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            if (currentPage == pages.length - 1) {
                              cubit.navigateToAuthScreen(context);
                            } else {
                              cubit.goToNextPage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 25),
                          ),
                          child: Text(
                            currentPage == pages.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: const TextStyle(
                                fontSize: 18, color: Color(0xFF0074B7)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
