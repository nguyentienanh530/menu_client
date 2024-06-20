import 'package:dio/dio.dart';
import '../../core/api_config.dart';
import 'dio_interceptor.dart';

//singleton class for DioClient
class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio? dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectionTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        responseType: ResponseType.json,
      ),
    );
    dio!.interceptors.add(DioInterceptor(dio!));
  }
}
