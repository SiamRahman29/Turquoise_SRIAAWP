import 'package:flutter/material.dart';
import 'package:studentmodule3/core/app_export.dart';
import 'package:studentmodule3/widgets/app_bar/custom_app_bar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          
            appBar: _buildAppBar(context),
            body: SingleChildScrollView( 
              child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  //CustomElevatedButton(text: "Teacher Name"),
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle51,
                    height: 43.v,
                    width: 430.h,
                  ),
                  CustomImageView(
                      imagePath: ImageConstant.imgSriaawp1,
                      height: 129.v,
                      width: 128.h),
                  SizedBox(height: 31.v),
                  Text("Turquoise", style: theme.textTheme.displaySmall),
                  SizedBox(height: 8.v),
                  Text("Student Module",
                      style: CustomTextStyles.headlineSmallExtraBold),
                  SizedBox(height: 52.v),
                  SizedBox(
                      height: 65.v,
                      width: 155.h,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 65.v,
                                width: 205.h,
                                decoration: BoxDecoration(
                                    color: appTheme.blueGray100))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                                onTap: () {
                                  onTapTxtSearchStudent(context);
                                },
                                child: SizedBox(
                                    width: 186.h,
                                    child: Text("Laporan Merit Pelajar",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge))))
                      ])),
                  SizedBox(height: 24.v),
                  SizedBox(
                      height: 65.v,
                      width: 155.h,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 65.v,
                                width: 205.h,
                                decoration: BoxDecoration(
                                    color: appTheme.blueGray100))),
                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () {
                                  onTapTxtGenerateLeaderboard(context);
                                },
                                child: SizedBox(
                                    width: 186.h,
                                    child: Text("Leaderboard",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge))))
                      ])),
                  SizedBox(height: 24.v),
                  SizedBox(
                      height: 65.v,
                      width: 155.h,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 65.v,
                                width: 205.h,
                                decoration: BoxDecoration(
                                    color: appTheme.blueGray100))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                                onTap: () {
                                  onTapTxtAiModule(context);
                                },
                                child: SizedBox(
                                    width: 106.h,
                                    child: Text("Hasilkan Ringkasan",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge))))
                      ])),
                  SizedBox(height: 27.v),
                  //CustomElevatedButton(
                    //  height: 36.v,
                      //width: 105.h,
                      //text: "Back",
                      //margin: EdgeInsets.only(right: 21.h),
                      //alignment: Alignment.centerRight,
                      //onPressed: () {
                        //Navigator.of(context).pop();
                      //}),
                  SizedBox(height: 54.v)
                ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 65.h,
        
        centerTitle: true,
        //title: AppbarTitle(
            //text: "Welcome ", margin: EdgeInsets.only(top: 52.v, bottom: 14.v)),
        actions: [
          Container(
              height: 57.v,
              width: 52.h,
              margin: EdgeInsets.fromLTRB(26.h, 22.v, 26.h, 18.v),
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 52.adaptSize,
                        width: 52.adaptSize,
                        margin: EdgeInsets.only(bottom: 5.v),
                        //decoration: BoxDecoration(
                          //  color: appTheme.black900,
                            //borderRadius: BorderRadius.circular(26.h))
                            )),
                //CustomImageView(
                  //  imagePath: ImageConstant.imgDefaultPfp2,
                    //height: 56.v,
                    //width: 52.h,
                    //alignment: Alignment.center,
                    //margin: EdgeInsets.only(top: 1.v),
                    //onTap: () {
                      //onTapImgDefaultPfpTwo(context);
                    //})
              ]))
        ],
        styleType: Style.bgFill);
  }

  /// Navigates to the teacherInfoScreen when the action is triggered.
  onTapImgDefaultPfpTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherInfoScreen);
  }

  /// Navigates to the generateLeaderboardScreen when the action is triggered.
  onTapTxtGenerateLeaderboard(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.generateLeaderboardScreen);
  }

  onTapTxtAiModule(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aimodule);
  }

  onTapTxtSearchStudent(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchStudentScreen);
  }
}
