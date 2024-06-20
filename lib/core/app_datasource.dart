import 'dart:convert';

import 'package:menu_client/core/app_string.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDatasource {
  // final prefs = SharedPreferences.getInstance();

  Future<bool> saveAccessToken(AccessToken accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(
        AppString.accessTokenkey, jsonEncode(accessToken));
  }

  Future<AccessToken?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return AccessToken.fromJson(
        jsonDecode(prefs.getString(AppString.accessTokenkey) ?? '{}'));
  }

  Future<bool> removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(AppString.accessTokenkey);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(AppString.refreshTokenkey, refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppString.refreshTokenkey);
  }

  //craete function for save use printer
  Future<bool> saveUsePrinter(bool usePrinter) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(AppString.usePrinterkey, usePrinter);
  }

  //craete function for get use printer
  Future<bool> getUsePrinter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppString.usePrinterkey) ?? false;
  }
}
