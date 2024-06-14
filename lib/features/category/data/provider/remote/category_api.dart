import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/category/data/model/category_model.dart';

class CategoryApi extends ApiBase<CategoryModel> {
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    Future<Either<String, List<CategoryModel>>> result = makeGetRequest(
        dioClient.dio!.get(ApiConfig.categories), CategoryModel.fromJson);
    return result;
  }
}
