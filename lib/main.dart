import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:text_case_4123123/app.dart';
import 'package:text_case_4123123/core/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // load environments
  late String envFileName;
  if (kDebugMode) {
    envFileName = AppConstants.testEnv;
  } else if (kProfileMode) {
    envFileName = AppConstants.stageEnv;
  } else {
    envFileName = AppConstants.prodEnv;
  }
  await dotenv.load(fileName: AppConstants.envBasePath + envFileName);
  runApp(const MyApp());
}
