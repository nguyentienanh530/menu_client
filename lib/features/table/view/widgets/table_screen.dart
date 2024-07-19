import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/empty_screen.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/common/widget/retry_dialog.dart';
import 'package:menu_client/core/app_asset.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/table/controller/table_controller.dart';

import '../../../../core/app_res.dart';
import '../../data/model/table_model.dart';

class TableDialog extends StatefulWidget {
  const TableDialog({super.key});

  @override
  State<TableDialog> createState() => _TableDialogState();
}

class _TableDialogState extends State<TableDialog> {
  final tableCtrl = Get.put(TableController());

  @override
  void initState() {
    tableCtrl.getTables();
    super.initState();
  }

  @override
  void dispose() {
    // tableCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(defaultMargin / 2),
          height: 45,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius),
                  topRight: Radius.circular(defaultBorderRadius))),
          child: const Text('Danh sách bàn', style: kHeadingWhiteStyle),
        ),
        Expanded(child: _buildBody(context)),
        Card(
          color: AppColors.lavender,
          margin: const EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Bàn đang sử dụng: ",
                      style: kBodyStyle,
                    ),
                    Text(
                      tableCtrl.table.value.name,
                      style: kBodyStyle.copyWith(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  margin: const EdgeInsets.all(defaultMargin / 2),
                  height: 45,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(defaultBorderRadius)),
                  child: const Text('Hủy', style: kButtonWhiteStyle),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return tableCtrl.obx(
        (state) => _buildLoadingSuccess(state ?? <TableModel>[]),
        onLoading: const Loading(),
        onEmpty: const EmptyScreen(),
        onError: (error) => RetryDialog(
            title: error ?? '', onRetryPressed: () => tableCtrl.getTables()));
  }

  Widget _buildLoadingSuccess(List<TableModel> tables) {
    var sortTables = [...tables];
    sortTables.sort((a, b) => a.name.compareTo(b.name));
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: GridView.builder(
            itemCount: tables.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: defaultPadding,
              crossAxisSpacing: defaultPadding,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) =>
                _buildItemTable(context, sortTables[index])));
  }

  Widget _buildItemTable(BuildContext context, TableModel table) {
    return GestureDetector(
        onTap: () {
          tableCtrl.table.value = table;
          Get.back(result: table);
        },
        child: LayoutBuilder(
            builder: (context, constraints) => Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          color: table.isUse
                              ? AppColors.islamicGreen
                              : AppColors.lavender,
                        ),
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Image.asset(AppAsset.dinnertable)),
                    SizedBox(
                      height: constraints.maxHeight,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            height: constraints.maxHeight * 0.4,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(defaultBorderRadius),
                                    bottomRight:
                                        Radius.circular(defaultBorderRadius)),
                                color: AppColors.black.withOpacity(0.8)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildString(
                                      table.name, kSubHeadingWhiteStyle),
                                  _buildString('Số ghế: ${table.seats} ',
                                      kBodyWhiteStyle),
                                  _buildString(
                                      'Tình trạng: ${AppRes.tableStatus(table.isUse)}',
                                      kBodyWhiteStyle)
                                ]),
                          )
                        ],
                      ),
                    )
                  ],
                )));
  }

  Widget _buildString(String value, TextStyle style) => Expanded(
      child:
          FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: style)));
}
