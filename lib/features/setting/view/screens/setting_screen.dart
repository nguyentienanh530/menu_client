import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/logout_dialog.dart';
import 'package:menu_client/core/app_style.dart';

import '../../../../core/app_asset.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_const.dart';
import '../../../auth/data/model/user_model.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  SettingScreen({super.key, this.userModel});
  final UserModel? userModel;
  var isUsePrint = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeColor,
        body: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Image.asset(AppAsset.background,
                  color: AppColors.black.withOpacity(0.15)),
            ),
            _buildAppbar(context),
            Column(
              children: [
                const SizedBox(height: 100),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultBorderRadius * 4),
                          topRight: Radius.circular(defaultBorderRadius * 4)),
                    ),
                    child: _buildBody(context),
                  ),
                ),
              ],
            )
            // _buildBody(context),
            // Expanded(child: _buildBody(context))
          ],
        ));
  }

  _buildAppbar(BuildContext context) => AppBar(
      backgroundColor: AppColors.transparent,
      foregroundColor: AppColors.white,
      centerTitle: true,
      title: Text('Thông tin',
          style: kSemiBoldTextStyle.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.white)));

  Widget _buildBody(BuildContext context) {
    // var a = context.select((UserCubit userCubit) => userCubit).state;
    // logger.d(a);

    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: _buildListAction(context, userModel ?? UserModel()));
  }

  Widget _buildListAction(BuildContext context, UserModel user) {
    return ListView(
        shrinkWrap: true,
        children: [
          _CardProfife(user: user),
          Column(children: [
            _ItemProfile(
                svgPath: 'assets/icon/user_config.svg',
                title: 'Cập nhật thông tin',
                onTap: () => _handleUserUpdated(context, user)),
            _ItemProfile(
              svgPath: 'assets/icon/lock.svg',
              title: 'Đổi mật khẩu',
              onTap: () {},
            ),
            // _buildItemPrint(context),
            _ItemProfile(
                svgPath: 'assets/icon/logout.svg',
                title: 'Đăng xuất',
                onTap: () => _handleLogout(context))
          ])
        ]
            .animate(interval: 50.ms)
            .slideX(
                begin: -0.1,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 500.ms)
            .fadeIn(curve: Curves.easeInOutCubic, duration: 500.ms));
  }

  Widget _buildItemPrint(BuildContext context) {
    // var isUsePrint = context.watch<IsUsePrintCubit>().state;
    return const SizedBox();
    // return Column(children: [
    //   GestureDetector(
    //       onTap: () {},
    //       child: Card(
    //           child: SizedBox(
    //               child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //             Row(children: [
    //               Padding(
    //                   padding: EdgeInsets.all(defaultPadding),
    //                   child: SvgPicture.asset('assets/icon/print.svg',
    //                       colorFilter: ColorFilter.mode(
    //                           context.colorScheme.primary, BlendMode.srcIn))),
    //               const Text('Sử dụng máy in')
    //             ]),
    //             Transform.scale(
    //                 scale: 0.8,
    //                 child: Switch(
    //                     activeTrackColor: context.colorScheme.secondary,
    //                     value: isUsePrint,
    //                     onChanged: (value) {
    //                       context
    //                           .read<IsUsePrintCubit>()
    //                           .onUsePrintChanged(value);
    //                       PrintDataSource.setIsUsePrint(value);
    //                     }))
    //           ])))),
    //   isUsePrint
    //       ? _ItemProfile(
    //           svgPath: 'assets/icon/file_setting.svg',
    //           title: 'Cấu hình máy in',
    //           onTap: () {
    //             //  context.push(RouteName.printSeting)
    //           })
    //       : const SizedBox()
    // ]);
  }

  _handleUserUpdated(BuildContext context, UserModel user) {
    // context.push<bool>(RouteName.updateUser, extra: user);
  }

  refreshUserData(BuildContext context) {
    // var userID = context.read<AuthBloc>().state.user.id;
    // context.read<UserBloc>().add(UserFecthed(userID: userID));
  }

  _handleLogout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => LogoutDialog(
              title: 'Chắc chắn muốn đăng xuất?',
              onRetryPressed: () {},
            ));
    // showCupertinoModalPopup<void>(
    //     context: context,
    //     builder: (context) => CommonBottomSheet(
    //         title: 'Chắc chắn muốn đăng xuất?',
    //         textCancel: 'Hủy',
    //         textConfirm: 'Đăng xuất',
    //         textConfirmColor: context.colorScheme.errorContainer,
    //         onConfirm: () {
    //           // context.read<AuthBloc>().add(const AuthLogoutRequested());
    //           // context.go(RouteName.login);
    //         }));
  }
}

class _ItemProfile extends StatelessWidget {
  const _ItemProfile(
      {required this.svgPath, required this.title, required this.onTap});
  final String svgPath;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
            child: SizedBox(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              Row(children: [
                Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: SvgPicture.asset(svgPath,
                        colorFilter: const ColorFilter.mode(
                            Colors.red, BlendMode.srcIn))),
                Text(title)
              ]),
              const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 15))
            ]))));
  }
}

class _CardProfife extends StatelessWidget {
  const _CardProfife({required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              user.image.isEmpty
                  ? _buildImageAsset(context)
                  : _buildImageNetwork(context),
              const SizedBox(height: defaultPadding),
              Text(user.fullName),
              const SizedBox(height: defaultPadding / 4),
              _buildItem(
                  context, Icons.email_rounded, user.phoneNumber.toString()),
              const SizedBox(height: defaultPadding / 4),
              user.phoneNumber.toString().isEmpty
                  ? const SizedBox()
                  : _buildItem(context, Icons.phone_android_rounded,
                      user.phoneNumber.toString())
            ])));
  }

  Widget _buildImageAsset(BuildContext context) {
    return Container(
        height: Get.width * 0.2,
        width: Get.width * 0.2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            shape: BoxShape.circle,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon/profile.png'))));
  }

  Widget _buildImageNetwork(BuildContext context) {
    return Container(
        height: Get.width * 0.2,
        width: Get.width * 0.2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(user.image))));
  }

  Widget _buildItem(BuildContext context, IconData icon, String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 15),
      const SizedBox(width: 3),
      Text(title, style: TextStyle(color: Colors.white.withOpacity(0.5)))
    ]);
  }
}
