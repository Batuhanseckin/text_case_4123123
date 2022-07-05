import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../interceptors/logger_interceptor.dart';

class ApiNetworkManager {
  static ApiNetworkManager? _instance;

  static ApiNetworkManager get instance => _instance ??= ApiNetworkManager._();

  ApiNetworkManager._() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    );
    dio = Dio(baseOptions);

    dio.interceptors.add(LoggerInterceptor());
  }

  late Dio dio;
}
