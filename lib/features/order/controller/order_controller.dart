import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/order/data/model/order_model.dart';
import 'package:menu_client/features/order/data/provider/remote/order_api.dart';

class OrderController extends GetxController
    with StateMixin<List<OrderModel>>, BaseController {
  final OrderApi orderApi = OrderApi();
  var orderModel = OrderModel().obs;

  void createOrder(OrderModel order) async {
    createItem(orderApi.createOrder(order: order));
  }

  // void createOrder(OrderModel order) async {
  //    try {
  //     final response = await orderApi.createOrder(order);

  //     final Order dataList = List<T>.from(
  //       json.decode(json.encode(response)).map(
  //             (item) => getJsonCallback(item),
  //           ),
  //     );
  //     return right(dataList);
  //   } catch (e) {
  //     final errorMessage = e.toString();

  //     return left(errorMessage);
  //   }
  // }

  // Future<void> createOrder(OrderModel order) async {
  //   change(null, status: RxStatus.loading());
  //   Either<String, OrderModel> failureOrSuccess =
  //       await orderApi.createOrder(order);
  //   failureOrSuccess.fold((String failure) {
  //     change(null, status: RxStatus.error(failure));
  //   }, (OrderModel order) {
  //     // todosCount.value = todos.length;
  //     categoryList = order.obs;
  //     if (categoryList.isEmpty) {
  //       change(null, status: RxStatus.empty());
  //     } else {
  //       change(banners, status: RxStatus.success());
  //     }
  //   });
  // }
}
