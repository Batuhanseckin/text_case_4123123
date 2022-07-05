import 'package:get_it/get_it.dart';
import 'package:text_case_4123123/api/cities_api_client.dart';
import 'package:text_case_4123123/repository/cities_repository.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Future<void> setUpLocator() async {
    //Register
    locator.registerLazySingleton(() => CitiesApiClient());
    locator.registerLazySingleton(() => CitiesRepository());
  }
}
