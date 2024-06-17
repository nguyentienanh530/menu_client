import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/order/data/model/order_model.dart';

class OrderApi extends ApiBase<OrderModel> {
  Future<Either<String, bool>> createOrder({OrderModel? order}) async {
    return await makePostRequest(
        dioClient.dio!.post(ApiConfig.createOrder, data: order!.toJson()));
  }
}
