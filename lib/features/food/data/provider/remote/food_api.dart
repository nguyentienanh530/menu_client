import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/features/food/data/model/food_model.dart';

class FoodApi extends ApiBase<FoodModel> {
  Future<Either<String, List<FoodModel>>> getFoods() async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        supabase.client.from('foods').select().eq('isShowFood', true),
        FoodModel.fromJson);
    return result;
  }

  Future<Either<String, List<FoodModel>>> getNewFoodsLimit() async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        supabase.client
            .from('foods')
            .select()
            .eq('isShowFood', 'true')
            .order('created_at')
            .limit(10),
        FoodModel.fromJson);
    return result;
  }

  Future<Either<String, List<FoodModel>>> getPopularFoodsLimit() async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        supabase.client
            .from('foods')
            .select()
            .eq('isShowFood', 'true')
            .order('count')
            .limit(10),
        FoodModel.fromJson);
    return result;
  }

  Future<Either<String, List<FoodModel>>> getFoodsOnCategory(
      {required int idCategory}) async {
    Future<Either<String, List<FoodModel>>> result = makeGetRequest(
        supabase.client.from('foods').select().eq('id_category', idCategory),
        FoodModel.fromJson);
    return result;
  }
}
