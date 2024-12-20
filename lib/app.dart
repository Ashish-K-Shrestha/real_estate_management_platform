import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/src/features/authentication/core/screens/dashboard/dashboard.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const Dashboard(),
    );
  }
}
