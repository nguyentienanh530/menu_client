import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/cart/controller/cart_controller.dart';
import 'package:menu_client/features/table/controller/table_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../common/widget/common_text_field.dart';
import '../../../../core/app_string.dart';
import '../../../food/data/model/food_model.dart';
import '../../../order/data/model/food_order.dart';
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
    return Form(
        child: Column(children: [
      Container(
        margin: const EdgeInsets.all(defaultPadding),
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: Text(_foodModel.name,
            textAlign: TextAlign.center,
            style:
                kRegularWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)),
      ),
      Expanded(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.priceSell, style: kRegularTextStyle),
                        const SizedBox(height: 10),
                        _Price(
                            price: AppRes.foodPrice(
                                isDiscount: _foodModel.isDiscount,
                                foodPrice: _foodModel.price,
                                discount:
                                    int.parse(_foodModel.discount.toString()))),
                        const SizedBox(height: 10),
                        Text(AppString.quantity, style: kRegularTextStyle),
                        const SizedBox(height: 10),
                        _buildQuantity(),
                        const SizedBox(height: 10),
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
                      child: _buildButtonAddToCart(orderModel, tableModel)),
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
    ]));
  }

  void _handleOnTapAddToCart(OrderModel order, TableModel table) async {
    if (table.name.isEmpty) {
      AppRes.showSnackBar('Chưa chọn bàn', false);
    } else {
      if (checkExistFood(order)) {
        AppRes.showSnackBar('Món ăn đã có trong giỏ hàng.', false);
      } else {
        var newFoodOrder = FoodOrder(
            foodID: _foodModel.id,
            foodImage: _foodModel.image,
            foodName: _foodModel.name,
            quantity: _quantity.value,
            totalPrice: _totalPrice.value,
            note: _noteCtrl.text,
            discount: _foodModel.discount,
            foodPrice: _foodModel.price,
            isDiscount: _foodModel.isDiscount);
        var newFoods = [...order.foods, newFoodOrder];
        double newTotalPrice = newFoods.fold(
            0, (double total, currentFood) => total + currentFood.totalPrice);
        order = order.copyWith(
            tableName: table.name,
            tableID: table.id,
            foods: newFoods,
            status: 'new',
            totalPrice: newTotalPrice);
        // context.read<CartCubit>().onCartChanged(order);
        cartCtrl.order.value = order;
        print(_foodModel.id);
        await Supabase.instance.client.rpc('increment', params: {
          'id': _foodModel.id,
        });

        // FoodRepository(firebaseFirestore: FirebaseFirestore.instance)
        //     .updateFood(
        //         foodID: newFoodOrder.foodID,
        //         data: {'count': FieldValue.increment(1)});
        Get.back();

        AppRes.showSnackBar(AppString.addedToCart, true);
      }
    }
  }

  bool checkExistFood(OrderModel orderModel) {
    var isExist = false;
    for (FoodOrder e in orderModel.foods) {
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
        builder: (context, quantity, child) => Card(
            color: AppColors.lavender,
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCounter(context, icon: Icons.remove, onTap: () {
                        decrementQuaranty();
                      }),
                      Text(quantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      _buildCounter(context, icon: Icons.add, onTap: () {
                        incrementQuaranty();
                      })
                    ]))));
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
            decoration: const BoxDecoration(
                color: AppColors.themeColor, shape: BoxShape.circle),
            height: 40,
            width: 40,
            // padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Icon(icon, size: 20, color: AppColors.white)));
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
