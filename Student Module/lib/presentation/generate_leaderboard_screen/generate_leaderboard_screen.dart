import 'package:farzad1463_s_application4/core/app_export.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:farzad1463_s_application4/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class GenerateLeaderboardScreen extends StatelessWidget {
  const GenerateLeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle53,
                      height: 43.v,
                      width: 430.h),
                  Spacer(flex: 40),
                  Text("Generated Leaderboard",
                      style: theme.textTheme.headlineLarge),
                  Spacer(flex: 59),
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 30.v,
                          width: 105.h,
                          margin: EdgeInsets.only(right: 24.h),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomIconButton(
                                height: 27.v,
                                width: 105.h,
                                alignment: Alignment.topCenter,
                                onTap: () {
                                  onTapBtnIconButton(context);
                                },
                                child: CustomImageView()),
                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtBack(context);
                                    },
                                    child: Text("Back",
                                        style: theme.textTheme.headlineSmall)))
                          ])))
                ])),
            bottomNavigationBar: _buildStackSeven(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 73.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgHome3,
            margin: EdgeInsets.only(left: 23.h, top: 27.v, bottom: 28.v),
            onTap: () {
              onTapHomeThree(context);
            }),
        actions: [
          Container(
              height: 56.v,
              width: 52.h,
              margin: EdgeInsets.fromLTRB(24.h, 20.v, 24.h, 21.v),
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 52.adaptSize,
                        width: 52.adaptSize,
                        margin: EdgeInsets.only(bottom: 4.v),
                        decoration: BoxDecoration(
                            color: appTheme.black900,
                            borderRadius: BorderRadius.circular(26.h)))),
                CustomImageView(
                    imagePath: ImageConstant.imgDefaultPfp2,
                    height: 56.v,
                    width: 52.h,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgDefaultPfpTwo(context);
                    })
              ]))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildStackSeven(BuildContext context) {
    return Container(
        height: 13.v,
        width: 37.h,
        margin: EdgeInsets.only(left: 198.h, right: 195.h, bottom: 13.v),
        decoration: AppDecoration.fillGray700,
        child: CustomImageView(
            imagePath: ImageConstant.imgVector1,
            height: 13.v,
            width: 37.h,
            alignment: Alignment.center));
  }

  /// Navigates to the sttudentScreen when the action is triggered.
  onTapHomeThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sttudentScreen);
  }

  /// Navigates to the teacherInfoScreen when the action is triggered.
  onTapImgDefaultPfpTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherInfoScreen);
  }

  /// Navigates to the sttudentScreen when the action is triggered.
  onTapBtnIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sttudentScreen);
  }

  /// Navigates to the sttudentScreen when the action is triggered.
  onTapTxtBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sttudentScreen);
  }
}
