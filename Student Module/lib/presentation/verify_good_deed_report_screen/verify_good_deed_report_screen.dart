import 'package:farzad1463_s_application4/core/app_export.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:farzad1463_s_application4/widgets/custom_outlined_button.dart';
import 'package:farzad1463_s_application4/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class VerifyGoodDeedReportScreen extends StatelessWidget {
  VerifyGoodDeedReportScreen({Key? key}) : super(key: key);

  TextEditingController vectorFourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle52,
                      height: 43.v,
                      width: 430.h),
                  SizedBox(height: 26.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 95.v,
                          width: 333.h,
                          margin: EdgeInsets.only(left: 29.h),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 26.h),
                                        child: Text("Good Deed",
                                            style: theme
                                                .textTheme.headlineSmall))),
                                CustomTextFormField(
                                    width: 333.h,
                                    controller: vectorFourController,
                                    textInputAction: TextInputAction.done,
                                    alignment: Alignment.bottomCenter,
                                    suffix: SizedBox(
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgVector2Black900,
                                            height: 66.v,
                                            width: 333.h)),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 66.v))
                              ]))),
                  SizedBox(height: 48.v),
                  _buildRemarksStack(context),
                  SizedBox(height: 55.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 40.h),
                          child: Text("Add Points for the Report?",
                              style: CustomTextStyles.headlineSmallBold))),
                  SizedBox(height: 12.v),
                  Container(
                      width: 333.h,
                      margin: EdgeInsets.only(left: 47.h, right: 50.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 51.h, vertical: 13.v),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: fs.Svg(ImageConstant.imgVector2Black900),
                              fit: BoxFit.cover)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 14.h, top: 4.v, bottom: 5.v),
                                child: Text("YES",
                                    style: CustomTextStyles.headlineSmallBold)),
                            Container(
                                height: 35.v,
                                width: 37.h,
                                margin: EdgeInsets.only(top: 4.v),
                                decoration:
                                    BoxDecoration(color: appTheme.blueGray100))
                          ])),
                  SizedBox(height: 47.v),
                  Container(
                      width: 333.h,
                      margin: EdgeInsets.only(left: 47.h, right: 50.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 51.h, vertical: 9.v),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: fs.Svg(ImageConstant.imgVector2Black900),
                              fit: BoxFit.cover)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 14.h, bottom: 17.v),
                                child: Text("NO",
                                    style: CustomTextStyles.headlineSmallBold)),
                            Container(
                                height: 35.v,
                                width: 37.h,
                                margin: EdgeInsets.only(bottom: 13.v),
                                decoration:
                                    BoxDecoration(color: appTheme.blueGray100))
                          ])),
                  SizedBox(height: 39.v),
                  CustomOutlinedButton(
                      width: 146.h,
                      text: "Submit",
                      rightIcon: Container(
                          margin: EdgeInsets.only(),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector2,
                              height: 46.v,
                              width: 146.h)),
                      onPressed: () {
                        onTapSubmit(context);
                      }),
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 32.v,
                          width: 105.h,
                          margin: EdgeInsets.only(right: 12.h),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 27.v,
                                    width: 105.h,
                                    decoration: BoxDecoration(
                                        color: appTheme.blueGray100))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtBack(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 21.h),
                                        child: Text("Back",
                                            style: theme
                                                .textTheme.headlineSmall))))
                          ]))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildTwoStack(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 72.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgHome3,
            margin: EdgeInsets.only(left: 22.h, top: 28.v, bottom: 27.v),
            onTap: () {
              onTapHomeThree(context);
            }),
        actions: [
          Container(
              height: 56.v,
              width: 52.h,
              margin: EdgeInsets.fromLTRB(24.h, 21.v, 24.h, 20.v),
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 53.v,
                        width: 49.h,
                        margin: EdgeInsets.only(left: 3.h, top: 3.v),
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
  Widget _buildRemarksStack(BuildContext context) {
    return SizedBox(
        height: 143.v,
        width: 383.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgVector2,
              height: 114.v,
              width: 383.h,
              alignment: Alignment.bottomCenter),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Text("Remarks",
                      style: CustomTextStyles.headlineSmallBold)))
        ]));
  }

  /// Section Widget
  Widget _buildTwoStack(BuildContext context) {
    return Container(
        height: 13.v,
        width: 37.h,
        margin: EdgeInsets.only(left: 195.h, right: 198.h, bottom: 13.v),
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

  /// Navigates to the generateLeaderboardScreen when the action is triggered.
  onTapSubmit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.generateLeaderboardScreen);
  }

  /// Navigates to the sttudentScreen when the action is triggered.
  onTapTxtBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sttudentScreen);
  }
}
