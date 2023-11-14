import 'package:farzad1463_s_application4/core/app_export.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:farzad1463_s_application4/widgets/custom_elevated_button.dart';
import 'package:farzad1463_s_application4/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SttudentScreen extends StatelessWidget {
  const SttudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomElevatedButton(text: "Teacher Name"),
                  Spacer(flex: 46),
                  CustomImageView(
                      imagePath: ImageConstant.imgSriaawp1,
                      height: 129.v,
                      width: 128.h),
                  SizedBox(height: 31.v),
                  Text("Turquoise", style: theme.textTheme.displaySmall),
                  SizedBox(height: 8.v),
                  Text("Student Module",
                      style: CustomTextStyles.headlineSmallExtraBold),
                  SizedBox(height: 17.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 39.h),
                      child: _buildFortyNine(context,
                          verifyGoodDeedText: "Report Good Deed",
                          generateSummaryText: "Generate Leaderboard",
                          onTapVectorFour: () {
                        onTapVectorTwo(context);
                      }, onTapVectorSix: () {
                        onTapVectorThree(context);
                      })),
                  SizedBox(height: 21.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 39.h),
                      child: _buildFortyNine(context,
                          verifyGoodDeedText: "Verify Good Deed Report",
                          generateSummaryText: "Generate Summary",
                          onTapVectorFour: () {
                        onTapVectorFour(context);
                      })),
                  Spacer(flex: 53),
                  SizedBox(height: 38.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 32.v,
                          width: 105.h,
                          margin: EdgeInsets.only(right: 21.h),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            CustomIconButton(
                                height: 27.v,
                                width: 105.h,
                                alignment: Alignment.topCenter,
                                child: CustomImageView()),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 21.h),
                                    child: Text("Back",
                                        style: theme.textTheme.headlineSmall)))
                          ])))
                ])),
            bottomNavigationBar: _buildImageStack(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 65.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgHome3,
            margin: EdgeInsets.only(left: 15.h, top: 29.v, bottom: 26.v)),
        centerTitle: true,
        title: AppbarTitle(
            text: "Welcome ", margin: EdgeInsets.only(top: 52.v, bottom: 14.v)),
        actions: [
          Container(
              height: 56.v,
              width: 52.h,
              margin: EdgeInsets.fromLTRB(18.h, 22.v, 18.h, 19.v),
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
  Widget _buildImageStack(BuildContext context) {
    return Container(
        height: 13.v,
        width: 37.h,
        margin: EdgeInsets.only(left: 199.h, right: 194.h, bottom: 6.v),
        decoration: AppDecoration.fillGray700,
        child: CustomImageView(
            imagePath: ImageConstant.imgVector1,
            height: 13.v,
            width: 37.h,
            alignment: Alignment.center));
  }

  /// Common widget
  Widget _buildFortyNine(
    BuildContext context, {
    required String verifyGoodDeedText,
    required String generateSummaryText,
    Function? onTapVectorFour,
    Function? onTapVectorSix,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 64.v,
          width: 166.h,
          margin: EdgeInsets.only(top: 3.v),
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: 141.h,
                    child: Text(verifyGoodDeedText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall!
                            .copyWith(color: appTheme.black900)))),
            CustomImageView(
                imagePath: ImageConstant.imgVector2,
                height: 61.v,
                width: 166.h,
                alignment: Alignment.center,
                onTap: () {
                  onTapVectorFour!.call();
                })
          ])),
      Container(
          height: 63.v,
          width: 166.h,
          margin: EdgeInsets.only(left: 20.h, bottom: 4.v),
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: 106.h,
                    child: Text(generateSummaryText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall!
                            .copyWith(color: appTheme.black900)))),
            CustomImageView(
                imagePath: ImageConstant.imgVector2,
                height: 61.v,
                width: 166.h,
                alignment: Alignment.center,
                onTap: () {
                  onTapVectorSix!.call();
                })
          ]))
    ]);
  }

  /// Navigates to the teacherInfoScreen when the action is triggered.
  onTapImgDefaultPfpTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherInfoScreen);
  }

  /// Navigates to the searchStudentScreen when the action is triggered.
  onTapVectorTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchStudentScreen);
  }

  /// Navigates to the generateLeaderboardScreen when the action is triggered.
  onTapVectorThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.generateLeaderboardScreen);
  }

  /// Navigates to the verifyGoodDeedReportScreen when the action is triggered.
  onTapVectorFour(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verifyGoodDeedReportScreen);
  }
}
