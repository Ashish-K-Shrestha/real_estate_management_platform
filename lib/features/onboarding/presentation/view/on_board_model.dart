// onboard_model.dart
class OnboardingPage {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// Define the pages list
final List<OnboardingPage> pages = [
  OnboardingPage(
    imagePath: 'assets/images/onboard1.png',
    title: 'Welcome to REM Platform',
    description:
        'Manage properties efficiently with our all-in-one real estate management solution.',
  ),
  OnboardingPage(
    imagePath: 'assets/images/onboard.png',
    title: 'Seamless Property Listings',
    description:
        'Easily list, update, and manage properties with real-time data.',
  ),
  OnboardingPage(
    imagePath: 'assets/images/onboard2.png',
    title: 'Smart Buyer Management',
    description:
        'Track buyer information, buy agreements, and payments effortlessly.',
  ),
];
