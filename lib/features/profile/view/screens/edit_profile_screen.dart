import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/common_text_field.dart';
import 'package:menu_client/common/widget/upload_image_dialog.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/core/utils.dart';
import 'package:menu_client/features/auth/controller/user_controller.dart';
import 'package:menu_client/features/auth/data/model/user_model.dart';

import '../../../../common/controller/base_controller.dart';
import '../../../../common/widget/error_build_image.dart';
import '../../../../common/widget/loading.dart';
import '../../../../core/api_config.dart';
import '../../../../core/app_asset.dart';
import '../../../../core/app_const.dart';
import '../../../../core/app_res.dart';

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
  final _phoneController = TextEditingController();

  final UserController _userController = Get.put(UserController());
  @override
  void initState() {
    userModel = widget.userModel;
    _nameController.text = userModel.fullName;
    _phoneController.text = '0${userModel.phoneNumber}';

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
      body: Column(
        children: [
          _buildAppBar(),
          Form(
            key: _formKey,
            child: Obx(() => Column(
                  children: [
                    const SizedBox(height: 120),
                    Center(
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
                    )),
                    const SizedBox(height: defaultPadding * 2),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding * 2),
                      child: Column(
                        children: [
                          const SizedBox(height: defaultPadding),
                          _buildUserNameField(),
                          const SizedBox(height: defaultPadding),
                          _buildPhoneField(),
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
                )),
          ),
        ],
      ),
    );
  }

  _buildAppBar() {
    return Container(
      height: Get.height * 0.1,
      color: AppColors.themeColor,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.highlight_remove_rounded,
                      color: AppColors.white),
                ),
                const Text('Cập nhật thông tin', style: kHeadingWhiteStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserNameField() => CommonTextField(
      controller: _nameController,
      onChanged: (value) {},
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập tên';
        }
        return null;
      },
      maxLines: 1,
      hintText: 'Tên',
      prefixIcon:
          Icon(Icons.person_rounded, color: AppColors.black.withOpacity(0.5)));

  Widget _buildPhoneField() => CommonTextField(
      controller: _phoneController,
      onChanged: (value) {},
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng điền số điện thoại';
        } else if (!AppRes.validatePhoneNumber(value)) {
          return 'Số điện thoại không hợp lệ';
        }
        return null;
      },
      maxLines: 1,
      hintText: 'Số điện thoại',
      prefixIcon: Icon(Icons.phone_android_rounded,
          color: AppColors.black.withOpacity(0.5)));

  Widget _buildButton() {
    return FilledButton(
        onPressed: () async {
          var isValid = _formKey.currentState?.validate() ?? false;
          if (isValid) {
            _formKey.currentState?.save();
            var newUser = UserModel(id: _userController.userModel.value.id);
            if (_userController.imageFile.value.path.isNotEmpty) {
              var image = await _userController
                  .uploadAvatar(_userController.imageFile.value);
              log('image: $image');
              newUser = newUser.copyWith(
                  fullName: _nameController.text,
                  phoneNumber: int.parse(_phoneController.text),
                  image: image);
            } else {
              newUser = newUser.copyWith(
                fullName: _nameController.text,
                phoneNumber: int.parse(_phoneController.text),
                image: _userController.userModel.value.image,
              );
            }
            log('updateUser: ${newUser.toJson()}');
            _updateUser(newUser);
          }
        },
        child: const Text(
          'Cập nhật',
          style: kButtonWhiteStyle,
        ));
  }

  void _updateUser(UserModel newUser) async {
    _userController.updateUser(userModel: newUser);
    Get.defaultDialog(
        // barrierDismissible: false,
        // title: 'Đang đăng hình...',
        title: 'Cập nhật',
        titleStyle: kSubHeadingStyle.copyWith(
            color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: AppColors.white,
        content: Obx(() {
          return Column(
            children: [
              _userController.imageFile.value.path.isEmpty
                  ? const SizedBox()
                  : UploadImageWidget(
                      imageName:
                          _userController.imageFile.value.path.split('/').last,
                      progress: 1),
              const SizedBox(height: defaultPadding * 2),
              switch (_userController.apiStatus.value) {
                ApiState.loading => const Loading(),
                ApiState.success => Column(
                    children: [
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: AppColors.islamicGreen),
                            SizedBox(width: defaultPadding),
                            Text('Cập nhật thành công!')
                          ]),
                      const SizedBox(height: defaultPadding * 3),
                      FilledButton(
                          onPressed: () {
                            _userController.userModel.value =
                                _userController.userModel.value.copyWith(
                              fullName: newUser.fullName,
                              phoneNumber: newUser.phoneNumber,
                              image: newUser.image,
                            );
                            newUser = UserModel();

                            Get.back();
                          },
                          child: const Text('Xác nhận')),
                    ],
                  ),
                ApiState.failure => Column(
                    children: [
                      const Row(children: [
                        Icon(Icons.error, color: AppColors.themeColor),
                        SizedBox(width: defaultPadding),
                        Text('Cập nhật thất bại!')
                      ]),
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Hủy')),
                          FilledButton(
                              onPressed: () {
                                _userController.updateUser(userModel: newUser);
                              },
                              child: const Text('Thử lại')),
                        ],
                      ),
                    ],
                  ),
              }
            ],
          );
        }));
  }
}
