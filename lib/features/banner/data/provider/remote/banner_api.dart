import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/banner/data/model/banner_model.dart';

class BannerApi extends ApiBase<BannerModel> {
  Future<Either<String, List<BannerModel>>> getBanners() async {
    Future<Either<String, List<BannerModel>>> result = makeGetRequest(
        dioClient.dio!.get(ApiConfig.banners), BannerModel.fromJson);

    return result;
  }
}
