import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/food/data/model/food_model.dart';

class FoodApi extends ApiBase<FoodModel> {
  Future<Either<String, List<FoodModel>>> getNewFoodsLimit(
      {required int limit}) async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        dioClient.dio!
            .get(ApiConfig.newFoods, queryParameters: {'limit': limit}),
        FoodModel.fromJson);
    return result;
  }

  Future<Either<String, List<FoodModel>>> getPopularFoodsLimit(
      {required int limit}) async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        dioClient.dio!
            .get(ApiConfig.popularFoods, queryParameters: {'limit': limit}),
        FoodModel.fromJson);
    return result;
  }

  Future<Either<String, List<FoodModel>>> getFoodsOnCategory(
      {required int categoryID}) async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        dioClient.dio!.get('${ApiConfig.foodsOnCategory}$categoryID'),
        FoodModel.fromJson);
    return result;
  }

  Future<Either<String, List<FoodModel>>> getFoods() async {
    Future<Either<String, List<FoodModel>>> result =
        makeGetRequest(dioClient.dio!.get(ApiConfig.foods), FoodModel.fromJson);
    return result;
  }
}
