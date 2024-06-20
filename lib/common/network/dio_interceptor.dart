import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import '../../core/app_datasource.dart';
import '../../features/auth/data/provider/remote/auth_api.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor(this.dio);
  final Dio dio;
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await AppDatasource().getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer ${accessToken.accessToken}';
      options.headers['Content-Type'] = 'application/json';
    }
    logger.i('====================START====================');
    logger.i('HTTP method => ${options.method} ');
    logger.i(
        'Request => ${options.baseUrl}${options.path}${options.queryParameters}');
    logger.i('Header  => ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;

    if (err.response?.statusCode == HttpStatus.unauthorized ||
        err.response?.data['message'] == 'Token expired') {
      try {
        AccessToken? accessToken = await AppDatasource().getAccessToken();
        final newAccessToken = await AuthApi().refreshToken(
            refreshToken: accessToken?.refreshToken ?? '',
            accessToken: accessToken?.accessToken ?? '');

        options.headers['Authorization'] =
            'Bearer ${newAccessToken?.accessToken}';

        return handler.resolve(await dio.fetch(options));
      } catch (e) {
        logger.e(e);
      }
    } else {
      logger.e(options.method); // Debug log
      logger.e(
          'Error: ${err.response!.statusCode}, Message: ${err.message}'); // Error log
      logger.e('Error message: ${err.response?.data['message']}');

      logger.e(
          'Request => ${options.baseUrl}${options.path}${options.queryParameters}');
    }

    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('Response => StatusCode: ${response.statusCode}'); // Debug log
    logger.d('Response => Body: ${response.data}'); // Debug log
    return super.onResponse(response, handler);
  }
}
