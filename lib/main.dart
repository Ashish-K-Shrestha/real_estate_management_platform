import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/app/app.dart';
import 'package:real_estate_management_platform/app/di/di.dart';
import 'package:real_estate_management_platform/core/network/hive_service.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
