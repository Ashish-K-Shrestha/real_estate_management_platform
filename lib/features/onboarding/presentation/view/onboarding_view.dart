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
                Color(0xFF0288D1),
                Color(0xFF00796B)
              ], // Updated gradient colors
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
                              Image.asset(
                                page.imagePath,
                                height: 350,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                page.title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Updated text color
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                page.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // Updated text color
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
              // Dot Indicator
              BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? const Color(
                                  0xFFFFFFFF) // Updated active dot color
                              : Colors.white.withOpacity(
                                  0.5), // Updated inactive dot color
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
                          ElevatedButton(
                            onPressed: () =>
                                cubit.navigateToAuthScreen(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                  0xFF0288D1), // Updated button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              'Skip',
                              style: TextStyle(color: Colors.white),
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
                            backgroundColor:
                                const Color(0xFF0288D1), // Updated button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text(
                            currentPage == pages.length - 1 ? 'Start' : 'Next',
                            style: const TextStyle(color: Colors.white),
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
