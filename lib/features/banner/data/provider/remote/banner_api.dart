import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/core/app_datasource.dart';
import 'package:menu_client/features/banner/data/model/banner_model.dart';

class BannerApi extends ApiBase<BannerModel> {
  Future<Either<String, List<BannerModel>>> getBanners() async {
    var accessToken = await AppDatasource().getAccessToken();
    Future<Either<String, List<BannerModel>>> result = makeGetRequest(
        dioClient.dio!.get(ApiConfig.banners,
            options: Options(headers: {
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json'
            })),
        BannerModel.fromJson);

    return result;
  }
}
