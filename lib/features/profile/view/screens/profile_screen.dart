import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/logout_dialog.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/auth/controller/auth_controller.dart';
import 'package:menu_client/features/profile/view/screens/edit_profile_screen.dart';
import '../../../../common/widget/error_build_image.dart';
import '../../../../common/widget/loading.dart';
import '../../../../core/api_config.dart';
import '../../../../core/app_asset.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_const.dart';
import '../../../auth/data/model/user_model.dart';
import '../../../print/controller/print_controller.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.userModel});
  final UserModel? userModel;

  final _printCtrl = Get.put(PrintController());
  final _authCtrl = Get.put(AuthController());

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
                    color: AppColors.black.withOpacity(0.15))),
            _buildAppbar(context),
            Column(children: [
              const SizedBox(height: 200),
              Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(defaultBorderRadius * 4),
                              topRight:
                                  Radius.circular(defaultBorderRadius * 4)))))
            ]),
            Column(
              children: [
                const SizedBox(height: 120),
                Center(
                  child: Card(
                    shape: const CircleBorder(),
                    elevation: 20.0,
                    shadowColor: AppColors.themeColor,
                    child: Container(
                        height: Get.width * 0.3,
                        width: Get.width * 0.3,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: userModel!.image.isEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.all(defaultPadding * 2),
                                child: SvgPicture.asset(AppAsset.image,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.smokeWhite, BlendMode.srcIn)),
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '${ApiConfig.host}${userModel!.image}',
                                placeholder: (context, url) => const Loading(),
                                errorWidget: errorBuilderForImage,
                                fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),
                Text(userModel?.fullName ?? '',
                    style: kSemiBoldTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black.withOpacity(0.7))),
                // const SizedBox(height: defaultPadding),
                // _buildItem(
                //     context, Icons.email_rounded, user.phoneNumber.toString()),
                const SizedBox(height: defaultPadding),
                _buildItem(context, Icons.phone_android_rounded,
                    '+84 ${userModel!.phoneNumber}'),
                const SizedBox(height: defaultPadding),
                FilledButton.icon(
                    onPressed: () => Get.to(() =>
                        EditProfileScreen(userModel: userModel ?? UserModel())),
                    label: const Text('Cập nhật thông tin'),
                    icon: const Icon(Icons.edit)),
                _buildBody(context),
              ],
            )
            // _buildBody(context),
            // Expanded(child: _buildBody(context))
          ],
        ));
  }

  Widget _buildItem(BuildContext context, IconData icon, String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 15, color: AppColors.black.withOpacity(0.7)),
      const SizedBox(width: 3),
      Text(title,
          style: kThinBlackTextStyle.copyWith(
              color: AppColors.black.withOpacity(0.7), fontSize: 12))
    ]);
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
          // _CardProfife(user: user),
          Column(children: [
            _ItemProfile(
              svgPath: AppAsset.lock,
              title: 'Đổi mật khẩu',
              onTap: () {},
            ),
            _buildItemPrint(context),
            const SizedBox(height: defaultPadding * 2),
            FilledButton.icon(
                onPressed: () => _handleLogout(context),
                label: const Text("Đăng xuất"),
                icon: const Icon(Icons.logout)),
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
    return Obx(() => Column(children: [
          Card(
              elevation: 4,
              shadowColor: AppColors.lavender,
              child: SizedBox(
                  width: Get.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: SvgPicture.asset(AppAsset.print,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.themeColor, BlendMode.srcIn))),
                          const Text('Sử dụng máy in')
                        ]),
                        Transform.scale(
                            scale: 0.8,
                            child: Switch(
                                activeTrackColor: AppColors.themeColor,
                                inactiveTrackColor:
                                    AppColors.themeColor.withOpacity(0.5),
                                inactiveThumbColor: AppColors.white,
                                value: _printCtrl.isUsePrinter.value,
                                onChanged: (value) async {
                                  _printCtrl.isUsePrinter.value = value;
                                  await _printCtrl.saveUsePrinter(value);
                                }))
                      ]))),
          _printCtrl.isUsePrinter.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2),
                  child: _ItemProfile(
                      svgPath: AppAsset.fileConfig,
                      title: 'Cấu hình máy in',
                      onTap: () {
                        //  context.push(RouteName.printSeting)
                      }),
                )
              : const SizedBox()
        ]));
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
            onRetryPressed: () => _authCtrl.logout()));
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
            elevation: 4,
            shadowColor: AppColors.lavender,
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

// class _CardProfife extends StatelessWidget {
//   const _CardProfife({required this.user});
//   final UserModel user;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         shadowColor: AppColors.lavender,
//         elevation: 4,
//         child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               _buildImageNetwork(context),
//               const SizedBox(height: defaultPadding),
//               Text(user.fullName,
//                   style: kSemiBoldTextStyle.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.black.withOpacity(0.7))),
//               // const SizedBox(height: defaultPadding),
//               // _buildItem(
//               //     context, Icons.email_rounded, user.phoneNumber.toString()),
//               const SizedBox(height: defaultPadding),
//               user.phoneNumber.toString().isEmpty
//                   ? const SizedBox()
//                   : _buildItem(context, Icons.phone_android_rounded,
//                       '+84 ${user.phoneNumber}')
//             ])));
//   }

  // Widget _buildImageNetwork(BuildContext context) {
  //   return Container(
  //       height: Get.width * 0.2,
  //       width: Get.width * 0.2,
  //       padding: const EdgeInsets.all(2),
  //       decoration: BoxDecoration(
  //           border: Border.all(color: Colors.red), shape: BoxShape.circle),
  //       child: Container(
  //           clipBehavior: Clip.hardEdge,
  //           decoration: const BoxDecoration(shape: BoxShape.circle),
  //           child: CachedNetworkImage(
  //               imageUrl: user.image,
  //               placeholder: (context, url) => const Loading(),
  //               errorWidget: errorBuilderForImage,
  //               fit: BoxFit.cover)));
  // }

 
// }
