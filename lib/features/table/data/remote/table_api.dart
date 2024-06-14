import 'package:dartz/dartz.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/table/data/model/table_model.dart';

import '../../../../common/network/api_base.dart';

// class TableApi extends ApiBase<TableModel> {
//   Future<Either<String, List<TableModel>>> getTables() async {
//     Future<Either<String, List<TableModel>>> result = makeGetRequest(
//         supabase.client.from(ApiConfig.tableTable).select(),
//         TableModel.fromJson);
//     return result;
//   }
// }
