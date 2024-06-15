class ApiConfig {
  static const token =
      "6369de3d8da8e764cc3c1cbe4121bb6741875de2c30dfd39df8fd351b6a508ea";
  static const String baseUrl = "http://192.168.1.196:80/api/v1";
  static const String host = "http://192.168.1.196:80/";
  // static const header = {
  //   'Authorization': 'Bearer $token',
  //   'content-Type': 'application/json',
  // };
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const String users = '/user';
  static const String banners = '/banners';
  static const String categories = '/categories';
  static const String foods = '/foods';
  static const String newFoods = '/foods/new-foods';
  static const String popularFoods = '/foods/popular-foods';
  static const String foodsOnCategory = '/foods/category/';
  static const String tables = '/tables';
}
