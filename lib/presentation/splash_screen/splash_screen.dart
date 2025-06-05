import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_car_app/core/utils/color_constant.dart';
import 'package:wash_car_app/widgets/custom_image_view.dart';
import 'package:wash_car_app/core/utils/image_constant.dart';
import 'package:wash_car_app/core/utils/size_utils.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.indigo800,
        body: SafeArea(
          child: Container(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgGroupWhiteA700,
                        height: getVerticalSize(140),
                        width: getHorizontalSize(120),
                        margin: getMargin(bottom: 5))
                  ])),
        ));
  }
}
