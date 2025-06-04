import 'package:carwash_app/core/app_export.dart';
import 'package:flutter/material.dart';

import 'app_bar/custum_bottom_bar_controller.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIcon,
      selectedicon: ImageConstant.imgHomeSelected,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFile,
      selectedicon: ImageConstant.imgIconBookingSelected,
      title: "lbl_booking".tr,
      type: BottomBarEnum.Booking,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgEyeIndigo800,
      selectedicon: ImageConstant.imgExplor,
      title: "lbl_explore".tr,
      type: BottomBarEnum.Explore,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSignal,
      selectedicon: ImageConstant.imgProfileSelected,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        right: 2,
      ),
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
      ),
      child:   GetBuilder<CustomBottomBarController>(
        init: CustomBottomBarController(),
        builder:(controller) =>  BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
            currentIndex: controller.selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(
                  24,
                ),
                width: getSize(
                  24,
                ),
                color: ColorConstant.indigo800,
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].selectedicon,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    // color: ColorConstant.indigo800,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 8,
                    ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitMedium12.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.5,
                        ),
                        color: ColorConstant.indigo800,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            controller.getIndex(index);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Booking,
  Explore,
  Profile
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.selectedicon,
    this.title,
    required this.type,
  });

  String icon;

  String? title;
String?selectedicon;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
