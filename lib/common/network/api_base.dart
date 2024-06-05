import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ApiBase<T> {
  final Supabase supabase = Supabase.instance;

  //Method template for checking whether api call is success or not
  Future<Either<String, bool>> _checkFailureOrSuccess(
      Future<dynamic> apiCallback) async {
    try {
      await apiCallback;
      return right(true);
    } catch (e) {
      final errorMessage = e.toString();
      return left(errorMessage);
    }
  }

  //Generic Method template for getting data from server
  Future<Either<String, List<T>>> makeGetRequest(Future<dynamic> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final response = await apiCallback;
      print(response);
      final List<T> dataList = List<T>.from(
        json.decode(json.encode(response)).map(
              (item) => getJsonCallback(item),
            ),
      );
      return right(dataList);
    } catch (e) {
      final errorMessage = e.toString();
      print(errorMessage);
      return left(errorMessage);
    }
  }
}
