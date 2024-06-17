import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:menu_client/core/app_asset.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/auth/controller/login_controller.dart';
import '../../../../common/widget/common_button.dart';
import '../../../../common/widget/common_text_field.dart';
import '../../../../core/app_const.dart';
import '../../../../core/app_string.dart';
import '../../data/model/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: false, body: LoginView());
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _oneUpperCase = ValueNotifier(false);
  final _oneLowerCase = ValueNotifier(false);
  final _oneNumericNumber = ValueNotifier(false);
  final _oneSpecialCharacter = ValueNotifier(false);
  final _least8Characters = ValueNotifier(false);
  final loginController = Get.put(LoginController());

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeColor,
        body: Stack(children: [
          Image.asset(AppAsset.background,
              color: AppColors.black.withOpacity(0.15)),
          Column(
            children: [
              SizedBox(height: Get.height * 0.3),
              Container(
                width: Get.width,
                height: Get.height * 0.7,
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultBorderRadius * 5),
                      topRight: Radius.circular(defaultBorderRadius * 5)),
                ),
                // child: BlocListener<LoginCubit, LoginState>(
                //     listener: (context, state) {
                //       switch (state.status) {
                //         case FormzSubmissionStatus.inProgress:
                //           AppAlerts.loadingDialog(context);
                //           break;
                //         case FormzSubmissionStatus.failure:
                //           AppAlerts.failureDialog(context,
                //               title: AppString.errorTitle,
                //               desc: state.errorMessage, btnCancelOnPress: () {
                //             context.read<LoginCubit>().resetStatus();
                //             context.pop();
                //           });
                //           break;
                //         case FormzSubmissionStatus.success:
                //           context.go(RouteName.home);
                //           break;
                //         default:
                //       }
                //     },
              ),
            ],
          ),
          Column(children: [
            SizedBox(height: Get.height * 0.15),
            Center(
              child: Card(
                shape: const CircleBorder(),
                elevation: 30,
                shadowColor: AppColors.themeColor,
                child: SizedBox(
                  width: Get.height * 0.3,
                  height: Get.height * 0.3,
                  child: Image.asset(AppAsset.logo),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 5, vertical: defaultPadding),
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: defaultPadding),
                          const Center(child: _Wellcome()),
                          const SizedBox(height: defaultPadding * 2),
                          _PhoneNumber(emailcontroller: _emailCtrl),
                          const SizedBox(height: defaultPadding),
                          _buildPassword(),
                          const SizedBox(height: defaultPadding * 2),
                          _buildValidPassword(),
                          const SizedBox(height: defaultPadding * 3),
                          _ButtonLogin(onTap: () => _handleLoginSubmited()),
                          const SizedBox(height: defaultPadding * 1),
                          const Center(child: _ButtonForgotPassword()),
                          const SizedBox(height: defaultPadding)
                        ]
                            .animate(interval: 50.ms)
                            .slideX(
                                begin: -0.1,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 400.ms)
                            .fadeIn(
                                curve: Curves.easeInOutCubic,
                                duration: 400.ms))),
              ),
            ))
          ])
        ]));
  }

  Widget _buildPassword() {
    var isShowPassword = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: isShowPassword,
        builder: (context, value, child) {
          return CommonTextField(
              maxLines: 1,
              controller: _passwordCtrl,
              hintText: AppString.password,
              validator: (password) => AppRes.validatePassword(password)
                  ? null
                  : 'Mật khẩu không hợp lệ',
              onChanged: (value) {
                // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                _passwordCtrl.text = value;
                RegExp(r'^(?=.*?[A-Z])').hasMatch(value)
                    ? _oneUpperCase.value = true
                    : _oneUpperCase.value = false;
                RegExp(r'^(?=.*?[a-z])').hasMatch(value)
                    ? _oneLowerCase.value = true
                    : _oneLowerCase.value = false;
                RegExp(r'^(?=.*?[a-z])').hasMatch(value)
                    ? _oneLowerCase.value = true
                    : _oneLowerCase.value = false;
                RegExp(r'^(?=.*?[0-9])').hasMatch(value)
                    ? _oneNumericNumber.value = true
                    : _oneNumericNumber.value = false;
                RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)
                    ? _oneSpecialCharacter.value = true
                    : _oneSpecialCharacter.value = false;
                value.length >= 8
                    ? _least8Characters.value = true
                    : _least8Characters.value = false;
              },
              obscureText: !value,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: GestureDetector(
                  onTap: () => isShowPassword.value = !isShowPassword.value,
                  child: Icon(
                      !value ? Icons.visibility_off : Icons.remove_red_eye)));
        });
  }

  Widget _buildValidPassword() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                _buildItemValidPassword(
                    valueListenable: _oneUpperCase, label: 'Ký tự hoa'),
                _buildItemValidPassword(
                    valueListenable: _oneLowerCase, label: 'Ký tự thường')
              ])),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                _buildItemValidPassword(
                    valueListenable: _oneNumericNumber, label: 'Ký tự số'),
                _buildItemValidPassword(
                    valueListenable: _oneSpecialCharacter,
                    label: 'Ký tự đặc biệt')
              ])),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                _buildItemValidPassword(
                    valueListenable: _least8Characters,
                    label: 'Ít nhất 8 ký tự')
              ]))
        ]);
  }

  Widget _buildItemValidPassword(
      {required ValueListenable<bool> valueListenable, required String label}) {
    return FittedBox(
        child: ValueListenableBuilder<bool>(
            valueListenable: valueListenable,
            builder: (context, value, child) => Row(children: [
                  Icon(Icons.check_circle_rounded,
                      size: 15, color: value ? AppColors.islamicGreen : null),
                  const SizedBox(width: 8),
                  Text(label,
                      style: kThinBlackTextStyle.copyWith(
                          fontSize: 12,
                          color: value ? AppColors.islamicGreen : null))
                ])));
  }

  void _handleLoginSubmited() {
    var isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      loginController.login(LoginModel(
          phoneNumber: _emailCtrl.text.trim(), password: 'minhlong@123'));
      // _passwordCtrl.text.trim()
      // context.read<LoginCubit>().logInWithCredentials(
      //     email: _emailCtrl.text.trim(), password: _passwordCtrl.text.trim());
    }
  }
}

class _Wellcome extends StatelessWidget {
  const _Wellcome();

  @override
  Widget build(BuildContext context) {
    return Text(AppString.welcomeBack,
        style: kBlackWhiteTextStyle.copyWith(
            fontSize: 28,
            color: AppColors.themeColor,
            fontWeight: FontWeight.bold));
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({required this.emailcontroller});
  final TextEditingController emailcontroller;
  @override
  Widget build(BuildContext context) {
    return CommonTextField(
        controller: emailcontroller,
        keyboardType: TextInputType.phone,
        maxLines: 1,
        hintText: AppString.phoneNumber,
        prefixIcon: const Icon(Icons.phone_android_rounded),
        validator: (value) {
          return AppRes.validatePhoneNumber(value)
              ? null
              : 'Số điện thoại không hợp lệ';
        },
        onChanged: (value) => emailcontroller.text = value);
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin({required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CommonButton(text: AppString.login, onTap: onTap);
  }
}

class _ButtonForgotPassword extends StatelessWidget {
  const _ButtonForgotPassword();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(AppString.forgotPassword,
          style: kThinBlackTextStyle.copyWith(
              fontSize: 12, fontStyle: FontStyle.italic)),
    );

    // GestureDetector(
    //     onTap: () {},
    //     child: CommonLineText(
    //         title: AppString.noAccount,
    //         value: AppString.signup,
    //         valueStyle: TextStyle(
    //             color: context.colorScheme.tertiaryContainer,
    //             fontWeight: FontWeight.bold)));
  }
}
