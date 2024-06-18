class AppString {
  AppString._();

  static const accessTokenkey = "access_token";

  //Api call error
  static const cancelRequest = "Request to API server was cancelled";
  static const connectionTimeOut = "Connection timeout with API server";
  static const receiveTimeOut = "Receive timeout in connection with API server";
  static const sendTimeOut = "Send timeout in connection with API server";
  static const socketException = "Check your internet connection";
  static const unexpectedError = "Unexpected error occurred";
  static const unknownError = "Something went wrong";
  static const duplicateEmail = "Email has already been taken";
  static const newPasswordSomeAsAOldPassword =
      "Mật khẩu mới bị trùng với mật khẩu cũ!";
  static const wrongPassword = "Sai mật khẩu";
  static const userNotFound = "Không tìm thấy người dùng";
  static const connectionError = "Lỗi kết nối";
  static const userExists = 'Người dùng đã tồn tại';
  static const tokenExpired = 'Hết hạn đăng nhập';

  //status code
  static const badRequest = "Bad request";
  static const unauthorized = "Unauthorized";
  static const forbidden = "Forbidden";
  static const notFound = "Not found";
  static const internalServerError = "Internal server error";
  static const badGateway = "Bad gateway";

  static const appFont = "Roboto";
  static const newFoods = "Món ăn mới";
  static const popularFood = 'Được chọn nhiều';
  static String titleFoodDetail = 'Chi tiết món ăn';
  static String cancel = 'Hủy';
  static String priceSell = 'Giá bán';
  static String quantity = 'Số lượng';
  static String note = 'Ghi chú:';
  static String addedToCart = 'Đã thêm vào giỏ hàng.';
  static String addToCart = 'Thêm giỏ hàng';
  static String totalPrice = 'Tổng tiền:';
  static String password = 'Mật khẩu';
  static String login = 'Đăng nhập';
  static String welcomeBack = 'Welcome!';
  static String phoneNumber = 'Số điện thoại';
  static String forgotPassword = 'Quên mật khẩu?';
}
