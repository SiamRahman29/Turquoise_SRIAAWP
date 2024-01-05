import 'package:flutter/material.dart';
import 'package:studentmodule3/core/app_export.dart';
import 'package:studentmodule3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class TeacherInfoScreen extends StatelessWidget {
  TeacherInfoScreen({Key? key}) : super(key: key);

  TextEditingController vectorTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildHomeThree(context),
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle5,
                      height: 43.v,
                      width: 430.h),
                  SizedBox(height: 42.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 72.h),
                          child: Text("Teacher Email",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 15.v),
                  Padding(
                      padding: EdgeInsets.only(left: 44.h, right: 53.h),
                      child: CustomTextFormField(
                          controller: vectorTwoController,
                          textInputAction: TextInputAction.done)),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildFour(context)));
  }

  /// Section Widget
  Widget _buildHomeThree(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 25.v),
        decoration: AppDecoration.fillTeal,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              CustomImageView(
                  imagePath: ImageConstant.imgHome3,
                  height: 42.v,
                  width: 50.h,
                  onTap: () {
                    onTapImgHomeThree(context);
                  })
            ]));
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
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

  /// Navigates to the landingScreen when the action is triggered.
  onTapImgHomeThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landingScreen);
  }
}
