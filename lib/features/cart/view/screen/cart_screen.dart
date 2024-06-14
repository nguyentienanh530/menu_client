import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/cart/controller/cart_controller.dart';
import 'package:menu_client/features/order/controller/order_controller.dart';

import '../../../../common/widget/async_widget.dart';
import '../../../../common/widget/empty_screen.dart';
import '../../../../core/app_res.dart';
import '../../../order/data/model/order_model.dart';
import '../../../print/data/model/print_model.dart';
import '../../../table/data/model/table_model.dart';
import '../widget/item_cart.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = Get.put(CartController());
  final orderController = Get.put(OrderController());
  // var table = context.watch<TableCubit>().state;
  // var isUsePrint = context.watch<IsUsePrintCubit>().state;
  // var print = context.watch<PrintCubit>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(context),
        // body: cartState.foods.isEmpty
        //     ? const EmptyScreen()
        //     : BlocListener<OrderBloc, GenericBlocState<OrderModel>>(
        //         listenWhen: (previous, current) =>
        //             previous.status != current.status ||
        //             context.read<OrderBloc>().operation == ApiOperation.create,
        //         listener: (context, state) => switch (state.status) {
        //               Status.loading => AppAlerts.loadingDialog(context),
        //               Status.empty => const SizedBox(),
        //               Status.failure => RetryDialog(
        //                   title: 'Xảy ra lỗi!',
        //                   onRetryPressed: () => context
        //                       .read<OrderBloc>()
        //                       .add(OrderCreated(orderModel: cartState))),
        //               Status.success =>
        //                 AppAlerts.successDialog(context, btnOkOnPress: () {
        //                   table = table.copyWith(isUse: true);
        //                   context
        //                       .read<TableBloc>()
        //                       .add(TableUpdated(tableModel: table));
        //                   _handlePrint(context,
        //                       cartState: cartState,
        //                       isUsePrint: isUsePrint,
        //                       print: print,
        //                       table: table);
        //                   context.read<CartCubit>().onCartClear();
        //                   context.read<TableCubit>().onTableClear();

        //                   context.pop();
        //                 }, desc: 'Cảm ơn quý khách!')
        //             },
        //         child: _buildBody(context, cartState))
        body: Obx(() => cartController.order.value.orderDetail.isEmpty
            ? const EmptyScreen()
            : _buildBody(context, cartController.order.value)));
  }

  void _handlePrint(BuildContext context,
      {required OrderModel cartState,
      required TableModel table,
      required bool isUsePrint,
      required PrintModel print}) {
    if (isUsePrint) {
      var listPrint = [];
      for (var element in cartState.orderDetail) {
        listPrint
            .add('${table.name} - ${element.foodName} - ${element.quantity}');
      }
      // logger.d(listPrint);
      // Ultils.sendPrintRequest(print: print, listDataPrint: listPrint);
    }
  }

  _buildAppbar(BuildContext context) => AppBar(
      backgroundColor: AppColors.themeColor,
      foregroundColor: AppColors.white,
      centerTitle: true,
      title: const Text('Giỏ hàng', style: kRegularWhiteTextStyle));

  Widget _buildBody(BuildContext context, OrderModel orderModel) {
    return Column(
        children: [
      Expanded(child: ItemCart(orderModel: orderModel)),
      Card(
          elevation: 10,
          margin: const EdgeInsets.all(defaultPadding),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Tổng tiền:'),
                Text(
                    AppRes.currencyFormat(
                        double.parse(orderModel.totalPrice.toString())),
                    style: kThinBlackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor))
              ]),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => submitCreateOrder(context),
                child: Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius)),
                    child: const Text('Lên đơn', style: kThinWhiteTextStyle)),
              )
              // AnimatedButton(
              //     color: context.colorScheme.tertiaryContainer,
              //     text: 'Lên đơn',
              //     buttonTextStyle: context.titleStyleMedium!
              //         .copyWith(fontWeight: FontWeight.bold),
              //     pressEvent: () => submitCreateOrder(context))
            ]),
          ))
    ]
            .animate(interval: 50.ms)
            .slideX(
                begin: -0.1,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 500.ms)
            .fadeIn(curve: Curves.easeInOutCubic, duration: 500.ms));
  }

  void submitCreateOrder(BuildContext context) {
    AppRes.comfirmDiaLog(
        content: 'Đơn đã lên sẽ không thể sửa, kiểm tra kĩ trước khi lên đơn!',
        onCancelTap: () => Get.back(),
        onConformTap: () => _handleCreateOrder(context));
  }

  void _handleCreateOrder(BuildContext context) {
    Get.back();
    var order = cartController.order.value;

    // orderController.createOrder(order);
    showDialog(
      context: context,
      builder: (_) {
        return Obx(
          () {
            return AsyncWidget(
              apiState: orderController.apiStatus.value,
              progressStatusTitle: "Đang lên đơn...",
              failureStatusTitle: orderController.errorMessage.value,
              successStatusTitle: "Lên đơn thành công!",
              onSuccessPressed: () {
                Navigator.pop(context);
                // controller.getTodos(widget.user.id!);
              },
              onRetryPressed: () {
                // orderController.createOrder(cartController.order.value);
              },
            );
          },
        );
      },
    );
  }

  // Widget _buildItemFood(
  //     BuildContext context, OrderModel orderModel, FoodOrder foo, int index) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: Slidable(
  //         endActionPane: ActionPane(
  //             extentRatio: 0.22,
  //             motion: const ScrollMotion(),
  //             children: [

  //               // SlidableAction(
  //               //     borderRadius: BorderRadius.circular(defaultBorderRadius),
  //               //     flex: 1,
  //               //     onPressed: (ct) {
  //               //       _handleDeleteItem(context, orderModel, foo);
  //               //     },
  //               //     backgroundColor: context.colorScheme.error,
  //               //     foregroundColor: Colors.white,
  //               //     icon: Icons.delete_forever)
  //             ]),
  //         child: ),
  //   );
  // }

  // Card(
  //                   color: context.colorScheme.errorContainer,
  //                   child: InkWell(
  //                       onTap: () =>
  //                           _handleDeleteItem(context, orderModel, foo),
  //                       child: SizedBox(
  //                           height: double.infinity,
  //                           width: context.sizeDevice.width * 0.05,
  //                           child: SvgPicture.asset('assets/icon/delete.svg',
  //                               fit: BoxFit.none,
  //                               colorFilter: const ColorFilter.mode(
  //                                   Colors.white, BlendMode.srcIn)))))
}
