import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/features/category/data/model/category_model.dart';

class CategoryApi extends ApiBase<CategoryModel> {
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    Future<Either<String, List<CategoryModel>>> result = makeGetRequest(
        supabase.client.from('categories').select(), CategoryModel.fromJson);
    return result;
  }
}
