import 'package:get/get.dart';

import '../../../core/app_datasource.dart';

class PrintController extends GetxController {
  var isUsePrinter = false.obs;

  @override
  void onInit() {
    initUsePrinter();
    super.onInit();
  }

  void initUsePrinter() async {
    isUsePrinter.value = await AppDatasource().getUsePrinter();
  }

  void toggleUsePrinter() {
    isUsePrinter.value = !isUsePrinter.value;
  }

  Future<void> saveUsePrinter(bool isUsePrinter) async {
    await AppDatasource().saveUsePrinter(isUsePrinter);
  }
}
