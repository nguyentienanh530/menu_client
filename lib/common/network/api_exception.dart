import 'package:menu_client/common/network/data_response.dart';
import 'package:menu_client/core/app_string.dart';

class ApiException {
  String fromApiError(DataResponse dataResponse) {
    late String message;
    switch (dataResponse.type) {
      case 'new-password-same-as-old-password':
        message = AppString.newPasswordSomeAsAOldPassword;
        break;
      case 'wrong-password':
        message = AppString.wrongPassword;
        break;
      case 'user-not-found':
        message = AppString.userNotFound;
        break;
      case 'user-exists':
        message = AppString.userExists;
        break;
      case 'connection-error':
        message = AppString.connectionError;
        break;

      case 'Token expired':
        message = AppString.tokenExpired;
        break;
      default:
        message = 'Unknown error';
        break;
    }
    return message;
  }
}
