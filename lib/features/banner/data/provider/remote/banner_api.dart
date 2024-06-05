import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/features/banner/data/model/banner_model.dart';

class BannerApi extends ApiBase<BannerModel> {
  Future<Either<String, List<BannerModel>>> getBanners() async {
    Future<Either<String, List<BannerModel>>> result = makeGetRequest(
        supabase.client.from('banners').select(), BannerModel.fromJson);
    return result;
  }
}
