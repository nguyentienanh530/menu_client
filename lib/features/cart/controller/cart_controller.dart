import 'package:get/get.dart';
import '../../../common/controller/base_controller.dart';
import '../../order/data/model/order_model.dart';

class CartController extends GetxController
    with StateMixin<OrderModel>, BaseController {
  Rx<OrderModel> order = OrderModel().obs;
}
