import 'package:menu_client/core/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDatasource {
  // final prefs = SharedPreferences.getInstance();

  Future<bool> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(AppString.accessTokenkey, accessToken);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppString.accessTokenkey);
  }
}
