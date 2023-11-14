import 'package:farzad1463_s_application4/core/app_export.dart';
import 'package:flutter/material.dart';

class TeacherInfoScreen extends StatelessWidget {
  const TeacherInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHomeThreeImage(context),
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle5,
                          height: 43.v,
                          width: 430.h),
                      SizedBox(height: 42.v),
                      Padding(
                          padding: EdgeInsets.only(left: 72.h),
                          child: Text("Teacher Name",
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 15.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector2Black900,
                          height: 66.v,
                          width: 333.h,
                          alignment: Alignment.center),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 72.h),
                          child: Text("Teacher ID",
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 7.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgVector2Black900,
                          height: 66.v,
                          width: 333.h,
                          alignment: Alignment.center),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildVectorOneImage(context)));
  }

  /// Section Widget
  Widget _buildHomeThreeImage(BuildContext context) {
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
  Widget _buildVectorOneImage(BuildContext context) {
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
  onTapImgHomeThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sttudentScreen);
  }
}
