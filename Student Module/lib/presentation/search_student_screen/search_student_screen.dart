import 'package:farzad1463_s_application4/core/app_export.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:farzad1463_s_application4/widgets/custom_icon_button.dart';
import 'package:farzad1463_s_application4/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class SearchStudentScreen extends StatelessWidget {
  const SearchStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle543x430,
                          height: 43.v,
                          width: 430.h),
                      SizedBox(height: 40.v),
                      Padding(
                          padding: EdgeInsets.only(left: 53.h),
                          child: Text("Name of Student",
                              style: theme.textTheme.titleLarge)),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector2Black900,
                          height: 66.v,
                          width: 333.h,
                          margin: EdgeInsets.only(left: 31.h)),
                      SizedBox(height: 41.v),
                      Container(
                          height: 90.v,
                          width: 333.h,
                          margin: EdgeInsets.only(left: 31.h),
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: 66.v,
                                    width: 333.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 31.h, vertical: 25.v),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: fs.Svg(ImageConstant
                                                .imgVector2Black900),
                                            fit: BoxFit.cover)),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgLocation,
                                        height: 15.v,
                                        width: 25.h,
                                        alignment: Alignment.topRight))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 38.h),
                                    child: Text("Standard",
                                        style: theme.textTheme.titleLarge)))
                          ])),
                      Spacer(flex: 55),
                      CustomOutlinedButton(
                          width: 146.h,
                          text: "Search",
                          rightIcon: Container(
                              margin: EdgeInsets.only(),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgVector2,
                                  height: 46.v,
                                  width: 146.h)),
                          buttonTextStyle: theme.textTheme.titleLarge!,
                          onPressed: () {
                            onTapSearch(context);
                          },
                          alignment: Alignment.center),
                      Spacer(flex: 44),
                      SizedBox(height: 27.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: 30.v,
                              width: 105.h,
                              margin: EdgeInsets.only(right: 13.h),
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    CustomIconButton(
                                        height: 27.v,
                                        width: 105.h,
                                        alignment: Alignment.topCenter,
                                        onTap: () {
                                          onTapBtnIconButton(context);
                                        },
                                        child: CustomImageView()),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 21.h),
                                            child: Text("Back",
                                                style: theme
                                                    .textTheme.headlineSmall)))
                                  ])))
                    ])),
            bottomNavigationBar: _buildNine(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgHome3,
            margin: EdgeInsets.only(left: 19.h, top: 27.v, bottom: 28.v),
            onTap: () {
              onTapHomeThree(context);
            }),
        actions: [
          Container(
              height: 56.v,
              width: 52.h,
              margin: EdgeInsets.fromLTRB(28.h, 20.v, 28.h, 21.v),
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
  Widget _buildNine(BuildContext context) {
    return Container(
        height: 13.v,
        width: 37.h,
        margin: EdgeInsets.only(left: 196.h, right: 196.h, bottom: 13.v),
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

  /// Navigates to the reportGoodDeedScreen when the action is triggered.
  onTapSearch(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reportGoodDeedScreen);
  }

  /// Navigates to the sttudentScreen when the action is triggered.
  onTapBtnIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sttudentScreen);
  }
}
