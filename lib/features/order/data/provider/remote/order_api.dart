import 'package:dartz/dartz.dart';
import 'package:menu_client/common/network/api_base.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/order/data/model/order_model.dart';

class OrderApi extends ApiBase<OrderModel> {
  // Future<List<Map<String, dynamic>>> createOrder(OrderModel order) async {
  //   return supabase.client.from(ApiConfig.orderTable).insert({
  //     'status': order.status,
  //     'table_id': order.tableID,
  //     'total_price': order.totalPrice
  //   }).select();
  // }

  // Future<Either<String, OrderModel>> createOrder(OrderModel order) async {
  //   Future<Either<String, OrderModel>> result = makeGetRequest2(
  //       supabase.client.from(ApiConfig.orderTable).insert({
  //         'status': order.status,
  //         'table_id': order.tableID,
  //         'total_price': order.totalPrice
  //       }).select(),
  //       OrderModel.fromJson);
  //   return result;
  // }
}
