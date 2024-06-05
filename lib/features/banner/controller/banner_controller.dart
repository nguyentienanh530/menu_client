import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/banner/data/model/banner_model.dart';

import '../data/provider/remote/banner_api.dart';

class BannerController extends GetxController
    with StateMixin<List<BannerModel>>, BaseController {
  final BannerApi bannerApi = BannerApi();
  List<BannerModel> categoryList = <BannerModel>[].obs;

  Future<void> getBanners() async {
    change(null, status: RxStatus.loading());
    Either<String, List<BannerModel>> failureOrSuccess =
        await bannerApi.getBanners();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<BannerModel> banners) {
      // todosCount.value = todos.length;
      categoryList = banners.obs;
      if (categoryList.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(banners, status: RxStatus.success());
      }
    });
  }
}
