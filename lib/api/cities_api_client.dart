import 'package:dio/dio.dart';
import 'package:text_case_4123123/core/constants/api_constants.dart';
import 'package:text_case_4123123/core/managers/api_network_manager.dart';
import 'package:text_case_4123123/models/response/base_model.dart';

class CitiesApiClient {
  Dio dio = ApiNetworkManager.instance.dio;

  Future<BaseModel> getAllCities() async {
    try {
      var response = await dio.get(
        ApiConstants.getAllCountries,
      );
      if (response.statusCode != 200) {
        return BaseModel(error: true);
      }
      return BaseModel.fromJson(response.data);
    } catch (e) {
      return BaseModel(error: true);
    }
  }
}
