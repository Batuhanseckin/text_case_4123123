import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:text_case_4123123/app.dart';
import 'package:text_case_4123123/core/constants/api_constants.dart';
import 'package:text_case_4123123/core/constants/app_constants.dart';
import 'package:text_case_4123123/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvironments();
  await LocatorInjector.setUpLocator();
  runApp(const MyApp());
}

Future<void> loadEnvironments() async {
  late String envFileName;
  if (kDebugMode) {
    envFileName = AppConstants.testEnv;
  } else if (kProfileMode) {
    envFileName = AppConstants.stageEnv;
  } else {
    envFileName = AppConstants.prodEnv;
  }
  await dotenv.load(fileName: AppConstants.envBasePath + envFileName);
  ApiConstants.baseUrl = dotenv.env['BASE_URL']!;
}
