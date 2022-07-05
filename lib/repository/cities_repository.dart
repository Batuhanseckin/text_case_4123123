import 'package:text_case_4123123/api/cities_api_client.dart';
import 'package:text_case_4123123/models/response/base_model.dart';

import '../locator.dart';

class CitiesRepository {
  final CitiesApiClient loginApiClient = locator<CitiesApiClient>();

  Future<BaseModel> getAllCities() async {
    return await loginApiClient.getAllCities();
  }
}
