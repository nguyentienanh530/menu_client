import 'package:dio/dio.dart' show Response, DioException;
import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_exception.dart';
import 'package:menu_client/common/network/data_response.dart';
import 'dart:convert';

import 'dio_client.dart';
import 'dio_exception.dart';

abstract class ApiBase<T> {
  //dioClient will be used in child classes
  final DioClient dioClient = DioClient();

  //Method template for checking whether api call is success or not
  Future<Either<String, bool>> _checkFailureOrSuccess(
      Future<Response<dynamic>> apiCallback) async {
    try {
      await apiCallback;
      return right(true);
    } on DioException catch (e) {
      var dataResponse = DataResponse.fromJson(e.response!.data);
      final errorMessage = ApiException().fromApiError(dataResponse).toString();
      return left(errorMessage);
    }
  }

  //Generic method template for create item on server
  Future<Either<String, bool>> makePostRequest(
      Future<Response<dynamic>> apiCallback) async {
    return _checkFailureOrSuccess(apiCallback);
  }

  //Generic method template for update item on server
  Future<Either<String, bool>> makePutRequest(
      Future<Response<dynamic>> apiCallback) async {
    return _checkFailureOrSuccess(apiCallback);
  }

  //Generic method template for delete item from server
  Future<Either<String, bool>> makeDeleteRequest(
      Future<Response<dynamic>> apiCallback) async {
    return _checkFailureOrSuccess(apiCallback);
  }

  //Generic Method template for getting data from server
  Future<Either<String, List<T>>> makeGetRequest(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;

      final List<T> dataList = List<T>.from(
        json.decode(json.encode(response.data['data'])).map(
              (item) => getJsonCallback(item),
            ),
      );

      return right(dataList);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }
}
