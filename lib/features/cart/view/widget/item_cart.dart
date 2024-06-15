import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/cart/controller/cart_controller.dart';
import '../../../../core/api_config.dart';
import '../../../../core/app_const.dart';
import '../../../order/data/model/order_detail_model.dart';
import '../../../order/data/model/order_model.dart';

// ignore: must_be_immutable
class ItemCart extends StatelessWidget {
  ItemCart({super.key, required this.orderModel, this.onTapDeleteFood});
  OrderModel orderModel;
  final void Function()? onTapDeleteFood;
  final _cartCtrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: orderModel.orderDetail.length,
        itemBuilder: (context, index) =>
            _buildItem(context, orderModel.orderDetail[index], index + 1));
  }

  Widget _buildItem(BuildContext context, OrderDetail orderDetail, int index) {
    return Card(
        margin: const EdgeInsets.all(defaultPadding),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, index, orderDetail),
                  Row(children: [
                    Expanded(child: _buildImage(orderDetail)),
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                        child: Text(orderDetail.foodName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    _buildQuality(context, orderDetail),
                                  ],
                                ),
                                const SizedBox(height: defaultPadding),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: defaultPadding),
                                          child: _buildPriceFood(
                                            context,
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            totalPrice: (orderDetail.foodPrice)
                                                .toString(),
                                          )),
                                      _buildPriceFood(
                                        context,
                                        color: AppColors.themeColor,
                                        totalPrice:
                                            (orderDetail.totalPrice).toString(),
                                      )
                                    ])
                              ]),
                        ))
                  ]),
                  orderDetail.note.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(),
                                const Text("Ghi chú: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(orderDetail.note,
                                    style: kThinBlackTextStyle)
                              ]))
                      : const SizedBox()
                ])));
  }

  Widget _buildPriceFood(BuildContext context,
      {required String totalPrice, required Color color}) {
    return Text(AppRes.currencyFormat(double.parse(totalPrice)),
        style: TextStyle(color: color, fontWeight: FontWeight.bold));
  }

  Widget _buildImage(OrderDetail food) {
    return Container(
        height: 65,
        width: 65,
        margin: const EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.3),
            image: DecorationImage(
                image: NetworkImage('${ApiConfig.host}${food.foodImage}'),
                fit: BoxFit.cover)));
  }

  Widget _buildQuality(BuildContext context, OrderDetail foodOrder) {
    var quantity = ValueNotifier(foodOrder.quantity);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      // LineText(title: "Số lượng: ", value: food.quantity.toString()),
      InkWell(
          onTap: () {
            if (quantity.value > 1) {
              quantity.value--;
              _handleUpdateFood(context, quantity.value, foodOrder);
            }
          },
          child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.black),
              child: const Icon(
                Icons.remove,
                size: 15,
                color: AppColors.white,
              ))),
      ValueListenableBuilder(
          valueListenable: quantity,
          builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(value.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold)))),
      InkWell(
          onTap: () {
            quantity.value++;
            _handleUpdateFood(context, quantity.value, foodOrder);
          },
          child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.black),
              child: const Icon(
                Icons.add,
                size: 15,
                color: AppColors.white,
              )))
    ]);
  }

  void _handleUpdateFood(
      BuildContext context, int quantity, OrderDetail foodOrder) {
    int index = orderModel.orderDetail
        .indexWhere((element) => element.foodID == foodOrder.foodID);

    if (index != -1) {
      var existingFoodOrder = orderModel.orderDetail[index];
      var updatedFoodOrder = existingFoodOrder.copyWith(
          quantity: quantity,
          totalPrice: quantity *
              AppRes.foodPrice(
                  isDiscount: existingFoodOrder.isDiscount,
                  foodPrice: existingFoodOrder.foodPrice,
                  discount: int.parse(existingFoodOrder.discount.toString())));

      List<OrderDetail> updatedFoods = List.from(orderModel.orderDetail);
      updatedFoods[index] = updatedFoodOrder;
      double newTotalPrice = updatedFoods.fold(
          0, (double total, currentFood) => total + currentFood.totalPrice);
      orderModel = orderModel.copyWith(
          orderDetail: updatedFoods, totalPrice: newTotalPrice);
      _cartCtrl.order.value = orderModel;
    } else {
      return;
    }
  }

  Widget _buildHeader(BuildContext context, int index, OrderDetail foodOrder) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 40,
        decoration: const BoxDecoration(
            color: AppColors.lavender,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultBorderRadius),
                topRight: Radius.circular(defaultBorderRadius))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('#$index', style: const TextStyle(fontWeight: FontWeight.bold)),
          _buildIconDeleteItemFood(context, foodOrder)
        ]));
  }

  Widget _buildIconDeleteItemFood(BuildContext context, OrderDetail foodOrder) {
    return GestureDetector(
        onTap: () => _handleDeleteItem(context, orderModel, foodOrder),
        child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                // color: context.colorScheme.errorContainer.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.themeColor)),
            child: const Icon(Icons.delete,
                size: 15, color: AppColors.themeColor)));
  }

  void _handleDeleteItem(
      BuildContext context, OrderModel orderModel, OrderDetail foo) {
    AppRes.showWanningDiaLog(
        // title: 'Xóa món "${foo.foodName}"?',
        title: 'Xóa món "?',
        content: 'Kiểm tra kĩ trước khi xóa!',
        onCancelTap: () => Get.back(),
        onConformTap: () {
          var newListOrder = [...orderModel.orderDetail];
          newListOrder.removeWhere((element) => element.foodID == foo.foodID);
          double newTotalPrice = newListOrder.fold(
              0, (double total, currentFood) => total + currentFood.totalPrice);
          orderModel = orderModel.copyWith(
              orderDetail: newListOrder, totalPrice: newTotalPrice);
          _cartCtrl.order.value = orderModel;
          Get.back();
        });
  }
}
