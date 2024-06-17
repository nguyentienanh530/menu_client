import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/cart/controller/cart_controller.dart';
import 'package:menu_client/features/table/controller/table_controller.dart';
import '../../../../common/widget/common_text_field.dart';
import '../../../../common/widget/error_build_image.dart';
import '../../../../common/widget/loading.dart';
import '../../../../core/api_config.dart';
import '../../../../core/app_string.dart';
import '../../../food/data/model/food_model.dart';
import '../../../order/data/model/order_detail_model.dart';
import '../../../order/data/model/order_model.dart';
import '../../../table/data/model/table_model.dart';

class OrderFoodBottomSheet extends StatefulWidget {
  const OrderFoodBottomSheet({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  State<OrderFoodBottomSheet> createState() => _OrderFoodBottomSheetState();
}

class _OrderFoodBottomSheetState extends State<OrderFoodBottomSheet> {
  final TextEditingController _noteCtrl = TextEditingController();
  var _foodModel = FoodModel();
  final _quantity = ValueNotifier(1);
  final _totalPrice = ValueNotifier<double>(1.0);
  double _priceFood = 0;
  final cartCtrl = Get.put(CartController());
  final _tableCtrl = Get.put(TableController());
  OrderModel orderModel = OrderModel();
  TableModel tableModel = TableModel();

  @override
  void initState() {
    _foodModel = widget.foodModel;
    _priceFood = AppRes.foodPrice(
        isDiscount: _foodModel.isDiscount,
        foodPrice: _foodModel.price,
        discount: int.parse(_foodModel.discount.toString()));
    _totalPrice.value = _quantity.value * _priceFood;

    super.initState();
  }

  @override
  void dispose() {
    _noteCtrl.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var order = context.watch<CartCubit>().state;
    // final table = context.watch<TableCubit>().state;
    tableModel = _tableCtrl.table.value;
    orderModel = cartCtrl.order.value;

    return Stack(children: [
      Column(
        children: [
          SizedBox(height: Get.height * 0.3),
          Container(
              height: Get.height * 0.7,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))))
        ],
      ),
      Column(children: [
        SizedBox(height: Get.height * 0.15),
        Center(child: _buildImage(_foodModel)),
        Expanded(
          child: Form(
              child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              _buildQuantity(),
                              const SizedBox(height: 10),
                              Text(AppString.priceSell,
                                  style: kRegularTextStyle),
                              const SizedBox(height: 10),
                              _Price(
                                  price: AppRes.foodPrice(
                                      isDiscount: _foodModel.isDiscount,
                                      foodPrice: _foodModel.price,
                                      discount: int.parse(
                                          _foodModel.discount.toString()))),
                              const SizedBox(height: 10),
                              // Text(AppString.quantity,
                              //     style: kRegularTextStyle),

                              Text(AppString.note, style: kRegularTextStyle),
                              const SizedBox(height: 10),
                              _Note(noteCtrl: _noteCtrl),
                              const SizedBox(height: 20)
                            ])))),
            Card(
                color: AppColors.lavender,
                margin: const EdgeInsets.all(16),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      _buildTotalPrice(),
                      const SizedBox(height: 8),
                      Row(children: [
                        Expanded(
                            child:
                                _buildButtonAddToCart(orderModel, tableModel)),
                        const SizedBox(width: defaultPadding / 2),
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: AppColors.themeColor,
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius)),
                                    child: Center(
                                        child: Text(AppString.cancel,
                                            style: kThinWhiteTextStyle)))))
                      ])
                    ])))
          ])),
        )
      ])
    ]);
  }

  Widget _buildImage(FoodModel food) {
    return Card(
        shape: const CircleBorder(),
        elevation: 30.0,
        shadowColor: AppColors.themeColor,
        child: Container(
            height: Get.height * 0.3,
            width: Get.height * 0.3,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '${ApiConfig.host}${food.photoGallery.first}',
                placeholder: (context, url) => const Loading(),
                errorWidget: errorBuilderForImage)));
  }

  void _handleOnTapAddToCart(OrderModel order, TableModel table) async {
    if (table.name.isEmpty) {
      AppRes.showSnackBar('Chưa chọn bàn', false);
    } else {
      if (checkExistFood(order)) {
        AppRes.showSnackBar('Món ăn đã có trong giỏ hàng.', false);
      } else {
        var newFoodOrder = OrderDetail(
            foodID: _foodModel.id,
            foodImage: _foodModel.photoGallery.first,
            foodName: _foodModel.name,
            quantity: _quantity.value,
            totalPrice: _totalPrice.value,
            note: _noteCtrl.text,
            discount: _foodModel.discount,
            foodPrice: _foodModel.price,
            isDiscount: _foodModel.isDiscount);
        var newFoods = [...order.orderDetail, newFoodOrder];
        double newTotalPrice = newFoods.fold(
            0, (double total, currentFood) => total + currentFood.totalPrice);
        order = order.copyWith(
            // tableName: table.name,
            // tableID: table.id,
            orderDetail: newFoods,
            // status: 'new',
            totalPrice: newTotalPrice);
        cartCtrl.order.value = order;
        Get.back();

        AppRes.showSnackBar(AppString.addedToCart, true);
      }
    }
  }

  bool checkExistFood(OrderModel orderModel) {
    var isExist = false;
    for (OrderDetail e in orderModel.orderDetail) {
      if (e.foodID == _foodModel.id) {
        isExist = true;
        break;
      }
    }
    return isExist;
  }

  Widget _buildButtonAddToCart(OrderModel orderModel, TableModel tableModel) {
    return InkWell(
        onTap: () {
          _handleOnTapAddToCart(orderModel, tableModel);
        },
        child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.fountainBlue,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Center(
                child: Text(AppString.addToCart, style: kThinWhiteTextStyle))));
  }

  Widget _buildTotalPrice() {
    return ValueListenableBuilder(
        valueListenable: _totalPrice,
        builder: (context, total, child) =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(AppString.totalPrice),
              Text(AppRes.currencyFormat(double.parse(total.toString())),
                  style: const TextStyle(
                      color: AppColors.themeColor, fontWeight: FontWeight.bold))
            ]));
  }

  Widget _buildQuantity() {
    return ValueListenableBuilder(
        valueListenable: _quantity,
        builder: (context, quantity, child) => Center(
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(defaultBorderRadius * 3),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCounter(context, icon: Icons.remove, onTap: () {
                        decrementQuaranty();
                      }),
                      Text(quantity.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white)),
                      _buildCounter(context, icon: Icons.add, onTap: () {
                        incrementQuaranty();
                      })
                    ]),
              ),
            ));
  }

  void decrementQuaranty() {
    if (_quantity.value > 1) {
      _quantity.value--;
      _totalPrice.value = _quantity.value * _priceFood;
    }
  }

  void incrementQuaranty() {
    _quantity.value++;
    _totalPrice.value = _quantity.value * _priceFood;
  }

  Widget _buildCounter(BuildContext context,
      {IconData? icon, Function()? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Icon(icon, size: 18, color: AppColors.white)));
  }
}

class _Price extends StatelessWidget {
  final num? price;
  const _Price({this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.lavender,
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppString.priceSell),
                  Text(AppRes.currencyFormat(double.parse(price.toString())),
                      style: const TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold))
                ])));
  }
}

class _Note extends StatelessWidget {
  const _Note({required this.noteCtrl});
  final TextEditingController noteCtrl;
  @override
  Widget build(BuildContext context) {
    return CommonTextField(
        controller: noteCtrl,
        prefixIcon: const Icon(Icons.sticky_note_2_outlined),
        hintText: 'thêm ghi chú cho đầu bếp',
        onChanged: (value) => noteCtrl.text = value);
  }
}
