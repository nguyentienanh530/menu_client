import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../common/controller/base_controller.dart';
import '../../order/data/model/order_model.dart';

class CartController extends GetxController
    with StateMixin<OrderModel>, BaseController {
  Rx<OrderModel> order = OrderModel().obs;
  WebSocketChannel? channel;

  @override
  void onInit() {
    getTableOnWebSocket();
    super.onInit();
  }

  void clearCart() {
    order.value = order.value.copyWith(orderDetail: []);
  }

  getTableOnWebSocket() async {
    channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.196:80/ws'));

    channel!.stream.listen(
      (event) {
        Map<String, dynamic> data = jsonDecode(event);
        log(data.toString());
      },
      onDone: () {
        debugPrint('Connection closed');
      },
      onError: (error) {
        debugPrint('Error occurred: $error');
      },
    );
  }
}
