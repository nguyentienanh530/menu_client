import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/async_widget.dart';
import 'package:menu_client/common/widget/common_text_field.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';

import '../../../../core/app_res.dart';
import '../../../../core/app_style.dart';
import '../../controller/forgot_password_controller.dart';
import '../../data/model/login_model.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Quên mật khẩu',
                  style: kSemiBoldTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: defaultPadding * 2),
              Text('Nhập số điện thoại của bạn để đổi mật khẩu',
                  style: kSemiBoldTextStyle.copyWith(
                      fontSize: 16, color: AppColors.black.withOpacity(0.5))),
              const SizedBox(height: defaultPadding * 4),
              Text('Số điện thoại',
                  style: kSemiBoldTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: defaultPadding),
              _buildPhoneField(),
              const SizedBox(height: defaultPadding * 2),
              Text('Mật khẩu mới',
                  style: kSemiBoldTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: defaultPadding),
              _buildPasswordField(),
              const SizedBox(height: defaultPadding * 2),
              Text('Xác nhận mật khẩu',
                  style: kSemiBoldTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: defaultPadding),
              _buildComfirmPasswordField(),
              const SizedBox(height: defaultPadding),
              Text(
                  '*Mật khẩu ít nhất 8 ký tự, bao gồm(ký tự hoa, ký tự thường, ký tự số, ký tự đặc biệt)',
                  style: kSemiBoldTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic)),
              const SizedBox(height: defaultPadding * 5),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius)),
                        side: const BorderSide(color: AppColors.themeColor),
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.all(defaultPadding),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        backgroundColor: AppColors.themeColor),
                    onPressed: () => _handleForgotPassword(),
                    child: Text('Đặt lại mật khẩu',
                        style: kSemiBoldTextStyle.copyWith(
                            color: AppColors.white, fontSize: 14)),
                  )),
              const SizedBox(height: defaultPadding * 2),
            ]),
          ),
        ));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: AppColors.black,
          iconSize: 24,
          splashRadius: 20,
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ));
  }

  Widget _buildPhoneField() => CommonTextField(
        controller: _phoneController,
        onChanged: (p0) {},
        keyboardType: TextInputType.phone,
        maxLines: 1,
        validator: (value) {
          return AppRes.validatePhoneNumber(value)
              ? null
              : 'Số điện thoại không hợp lệ';
        },
        hintText: 'Nhập số điện thoại của bạn',
        prefixIcon: Icon(
          Icons.phone_android_outlined,
          color: AppColors.black.withOpacity(0.5),
        ),
      );

  Widget _buildPasswordField() => Obx(() => CommonTextField(
        controller: _passwordController,
        onChanged: (p0) {},
        keyboardType: TextInputType.visiblePassword,
        maxLines: 1,
        validator: (value) {
          return AppRes.validatePassword(value)
              ? null
              : 'mật khẩu không hợp lệ';
        },
        hintText: 'Nhập mật khẩu mới',
        prefixIcon: Icon(
          Icons.lock_outline,
          color: AppColors.black.withOpacity(0.5),
        ),
        obscureText: !_forgotPasswordController.isShowPassword.value,
        suffixIcon: GestureDetector(
          onTap: () {
            _forgotPasswordController.toggleShowPassword();
          },
          child: Icon(
            _forgotPasswordController.isShowPassword.value
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
      ));

  Widget _buildComfirmPasswordField() => Obx(() => CommonTextField(
        controller: _confirmPasswordController,
        onChanged: (p0) {},
        keyboardType: TextInputType.visiblePassword,
        maxLines: 1,
        validator: (value) {
          if (_passwordController.text != _confirmPasswordController.text) {
            return 'Xác nhận mật khẩu không khớp';
          }
          return AppRes.validatePassword(value)
              ? null
              : 'mật khẩu không hợp lệ';
        },
        hintText: 'Nhập xác nhận mật khẩu',
        obscureText: !_forgotPasswordController.isShowConfirmPassword.value,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: AppColors.black.withOpacity(0.5),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            _forgotPasswordController.toggleShowConfirmPassword();
          },
          child: Icon(
            _forgotPasswordController.isShowConfirmPassword.value
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
      ));

  _handleForgotPassword() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var loginModel = LoginModel(
          phoneNumber: _phoneController.text.trim(),
          password: _passwordController.text.trim());

      _forgotPassword(loginModel);
    }
  }

  void _forgotPassword(LoginModel loginModel) {
    _forgotPasswordController.resetPassword(loginModel);
    showDialog(
        context: context,
        builder: (_) {
          return Obx(() => AsyncWidget(
              apiState: _forgotPasswordController.apiStatus.value,
              progressStatusTitle: 'Đang xử lý...',
              failureStatusTitle: _forgotPasswordController.errorMessage.value,
              successStatusTitle: 'Đặt lại mật khẩu thành công!',
              onRetryPressed: () =>
                  _forgotPasswordController.resetPassword(loginModel),
              onSuccessPressed: () {
                _phoneController.clear();
                _passwordController.clear();
                _confirmPasswordController.clear();
                Get.offAll(() => const LoginScreen());
              }));
        });
  }
}
