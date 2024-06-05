import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/error_build_image.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../banner/data/model/banner_model.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key, this.banners});
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final indexPage = ValueNotifier(0);
  final List<BannerModel>? banners;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexPage,
        builder: (context, value, child) => Stack(children: [
              CarouselSlider.builder(
                  // carouselController: controller,
                  itemBuilder: (context, index, realIndex) =>
                      _buildItemBanner(banners![index]),
                  itemCount: banners!.length,
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        indexPage.value = index;
                      },
                      enlargeFactor: 0,
                      height: double.infinity,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.linearToEaseOut,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal)),
              Column(children: [
                const Spacer(),
                SizedBox(
                    height: Get.height * 0.05,
                    child: Center(
                        child: _buildIndicator(context, banners!.length)))
              ])
            ]));
  }

  Widget _buildIndicator(BuildContext context, int length) {
    return AnimatedSmoothIndicator(
        activeIndex: indexPage.value,
        count: length,
        effect: const SwapEffect(
            activeDotColor: AppColors.themeColor,
            dotHeight: 8,
            dotWidth: 8,
            dotColor: AppColors.white,
            type: SwapType.zRotation));
  }

  Widget _buildItemBanner(BannerModel item) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CachedNetworkImage(
            imageUrl: item.image ?? '',
            placeholder: (context, url) => const Loading(),
            errorWidget: errorBuilderForImage,
            fit: BoxFit.cover));
  }
}
