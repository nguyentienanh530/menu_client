class ApiConfig {
  ApiConfig._();

  static const String baseUrl = "http://192.168.1.196:80/api/v1";
  static const String host = "http://192.168.1.196:80";
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
  static const String createOrder = '/orders/create-order';
  static const String login = '/auth/login';
  static const String forgotPassword = '/auth/forgot-password';
  static const String user = '/user';
  static const String updateUser = '/user/update';
  static const String uploadAvatar = '/user/upload-avatar';
  static const String refreshToken = '/auth/refresh-token';
  static const String logout = '/auth/logout';
}
