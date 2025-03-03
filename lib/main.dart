import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/app.dart';
import 'package:real_estate_management_platform/app/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  // Ensure dependencies are initialized
  runApp(const App());
}
