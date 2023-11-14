import 'package:farzad1463_s_application4/core/app_export.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:farzad1463_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:farzad1463_s_application4/widgets/custom_icon_button.dart';
import 'package:farzad1463_s_application4/widgets/custom_outlined_button.dart';
import 'package:farzad1463_s_application4/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class ReportGoodDeedScreen extends StatelessWidget {
  ReportGoodDeedScreen({Key? key}) : super(key: key);

  TextEditingController vectorTwoController = TextEditingController();

  TextEditingController vectorTwoController1 = TextEditingController();

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
                      imagePath: ImageConstant.imgRectangle51,
                      height: 43.v,
                      width: 430.h),
                  SizedBox(height: 29.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 70.h),
                          child: Text("Good Deed",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 1.v),
                  Container(
                      height: 66.v,
                      width: 333.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.h, vertical: 25.v),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: fs.Svg(ImageConstant.imgVector2Black900),
                              fit: BoxFit.cover)),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 15.v,
                          width: 25.h,
                          alignment: Alignment.topRight)),
                  SizedBox(height: 29.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 81.h),
                          child: Text("Date",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 1.v),
                  Padding(
                      padding: EdgeInsets.only(left: 44.h, right: 53.h),
                      child: CustomTextFormField(
                          controller: vectorTwoController,
                          suffix: SizedBox(
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgVector2Black900,
                                  height: 66.v,
                                  width: 333.h)),
                          suffixConstraints: BoxConstraints(maxHeight: 66.v))),
                  SizedBox(height: 21.v),
                  _buildReportForm(context),
                  SizedBox(height: 87.v),
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
                  Spacer(),
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 32.v,
                          width: 105.h,
                          margin: EdgeInsets.only(right: 24.h),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            CustomIconButton(
                                height: 27.v,
                                width: 105.h,
                                alignment: Alignment.topCenter,
                                onTap: () {
                                  onTapBtnIconButton(context);
                                },
                                child: CustomImageView()),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 21.h),
                                    child: Text("Back",
                                        style: theme.textTheme.headlineSmall)))
                          ])))
                ])),
            bottomNavigationBar: _buildStackImage(context)));
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
  Widget _buildReportForm(BuildContext context) {
    return SizedBox(
        height: 143.v,
        width: 383.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Text("Remarks",
                      style: CustomTextStyles.headlineSmallBold))),
          CustomTextFormField(
              width: 383.h,
              controller: vectorTwoController1,
              textInputAction: TextInputAction.done,
              alignment: Alignment.bottomCenter,
              suffix: SizedBox(
                  child: CustomImageView(
                      imagePath: ImageConstant.imgVector2,
                      height: 114.v,
                      width: 383.h)),
              suffixConstraints: BoxConstraints(maxHeight: 114.v))
        ]));
  }

  /// Section Widget
  Widget _buildStackImage(BuildContext context) {
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

  /// Navigates to the verifyGoodDeedReportScreen when the action is triggered.
  onTapSubmit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verifyGoodDeedReportScreen);
  }

  /// Navigates to the searchStudentScreen when the action is triggered.
  onTapBtnIconButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchStudentScreen);
  }
}
