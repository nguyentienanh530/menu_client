import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/common_background.dart';
import 'package:menu_client/common/widget/common_text_field.dart';
import 'package:menu_client/common/widget/upload_image_dialog.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/core/utils.dart';
import 'package:menu_client/features/auth/controller/user_controller.dart';
import 'package:menu_client/features/auth/data/model/user_model.dart';

import '../../../../common/widget/error_build_image.dart';
import '../../../../common/widget/loading.dart';
import '../../../../core/api_config.dart';
import '../../../../core/app_asset.dart';
import '../../../../core/app_const.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final UserModel userModel;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  var _imageFile;
  final UserController _userController = Get.put(UserController());
  @override
  void initState() {
    userModel = widget.userModel;
    _nameController.text = userModel.fullName;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _userController.imageFile.value = File("");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeColor,
        body: Stack(
          children: [
            const CommonBackground(),
            _buildAppbar(),
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
                Obx(() => Center(
                        child: Stack(
                      children: [
                        _userController.imageFile.value.path.isEmpty
                            ? Card(
                                shape: const CircleBorder(),
                                elevation: 20.0,
                                shadowColor: AppColors.themeColor,
                                child: Container(
                                    height: Get.width * 0.3,
                                    width: Get.width * 0.3,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: userModel.image.isEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.all(
                                                defaultPadding * 2),
                                            child: SvgPicture.asset(
                                                AppAsset.image,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        AppColors.smokeWhite,
                                                        BlendMode.srcIn)),
                                          )
                                        : CachedNetworkImage(
                                            imageUrl:
                                                '${ApiConfig.host}${userModel.image}',
                                            placeholder: (context, url) =>
                                                const Loading(),
                                            errorWidget: errorBuilderForImage,
                                            fit: BoxFit.cover)),
                              )
                            : Card(
                                shape: const CircleBorder(),
                                elevation: 20.0,
                                shadowColor: AppColors.themeColor,
                                child: Container(
                                    height: Get.width * 0.3,
                                    width: Get.width * 0.3,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: Image.file(
                                        _userController.imageFile.value,
                                        fit: BoxFit.cover))),
                        Positioned(
                            bottom: 5,
                            right: 20,
                            child: GestureDetector(
                                onTap: () async => await Ultils()
                                    .pickImage()
                                    .then((image) => _userController
                                        .imageFile.value = image),
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.white, width: 2),
                                        color: AppColors.smokeWhite1,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.photo,
                                        size: 20,
                                        color: AppColors.black
                                            .withOpacity(0.5))))),
                      ],
                    ))),
                const SizedBox(height: defaultPadding * 2),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding * 2),
                  child: Column(
                    children: [
                      const SizedBox(height: defaultPadding),
                      _buildUsername(),
                      // _buildItem(
                      //     context, Icons.email_rounded, user.phoneNumber.toString()),
                      const SizedBox(height: defaultPadding * 5),

                      _buildButton()

                      // _buildItem(context, Icons.phone_android_rounded,
                      //     '+84 ${userModel!.phoneNumber}'),
                      // const SizedBox(height: defaultPadding),
                      // FilledButton.icon(
                      //     onPressed: () => Get.to(() =>
                      //         EditProfileScreen(userModel: userModel ?? UserModel())),
                      //     label: const Text('Cập nhật thông tin'),
                      //     icon: const Icon(Icons.edit)),
                      // _buildBody(context),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  _buildAppbar() => AppBar(
      backgroundColor: AppColors.transparent, foregroundColor: AppColors.white);

  Widget _buildUsername() => CommonTextField(
      controller: _nameController,
      onChanged: (value) {},
      keyboardType: TextInputType.name,
      maxLines: 1,
      hintText: 'Tên',
      prefixIcon:
          Icon(Icons.person_rounded, color: AppColors.black.withOpacity(0.5)));

  Widget _buildButton() {
    return FilledButton(
        onPressed: () {
          if (_userController.imageFile.value.path.isEmpty) {
            Get.snackbar('Thư viện', 'Vui lý chọn hiệu hiện',
                backgroundColor: AppColors.themeColor,
                colorText: AppColors.white);
          } else {
            // _userController.uploadAvatar(_userController.imageFile.value);
            uploadAvatar();
          }
        },
        child: const Text('Cập nhật'));
  }

  void uploadAvatar() async {
    Get.defaultDialog(
        // barrierDismissible: false,
        // title: 'Đang đăng hình...',
        title: '',
        titleStyle: kSemiBoldTextStyle.copyWith(color: AppColors.black),
        backgroundColor: AppColors.white,
        content: Card(
          elevation: 4,
          shadowColor: AppColors.lavender,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.file_present_rounded,
                        color: AppColors.themeColor),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: Text(
                        _userController.imageFile.value.path.split('/').last,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: defaultPadding),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          color: AppColors.themeColor,
                          backgroundColor: AppColors.smokeWhite,

                          // value: _userController.uploadProgress.value,
                        ),
                      ),
                      Expanded(
                          child: Center(
                        child: Text(
                          '100%',
                          style: TextStyle(fontSize: 12),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
