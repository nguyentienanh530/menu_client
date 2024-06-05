import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/features/table/data/model/table_model.dart';
import 'package:menu_client/features/table/data/remote/table_repo.dart';

import '../../../common/controller/base_controller.dart';

class TableController extends GetxController
    with StateMixin<List<TableModel>>, BaseController {
  final TableApi tableApi = TableApi();
  List<TableModel> tables = <TableModel>[].obs;
  var table = TableModel().obs;

  Future<void> getTables() async {
    change(null, status: RxStatus.loading());
    Either<String, List<TableModel>> failureOrSuccess =
        await tableApi.getTables();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<TableModel> tables) {
      tables = tables.obs;
      if (tables.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(tables, status: RxStatus.success());
      }
    });
  }
}
