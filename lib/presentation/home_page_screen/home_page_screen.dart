import 'package:Turquoise/core/app_export.dart';
import 'package:Turquoise/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            
            children: [
              _buildWelcomeText(context),
              _buildTeacherNameText(context),
              SizedBox(height: 57.v),
              CustomImageView(
                imagePath: ImageConstant.imgSriaawp1,
                height: 178.v,
                width: 177.h,
              ),
              SizedBox(height: 60.v),
              Text(
                "Turquoise",
                style: theme.textTheme.displaySmall,
              ),
              SizedBox(height: 44.v),
              CustomOutlinedButton(
                width: 220.h,
                text: "Teacher\nModule",
                //alignment: Alignment.center,
                onPressed: () {
                  onTapView2(context);
                }
              ),
              SizedBox(height: 44.v),
              CustomOutlinedButton(
                width: 220.h,
                text: "Student\nModule",
                //alignment: Alignment.center,
                onPressed: () {
                  onTapView(context);
                },
              ),
              Spacer(),
              Container(
                height: 39.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: appTheme.gray200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 121.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillTeal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 15.v),
          Text(
            "Welcome ",
            style: theme.textTheme.displayMedium,
             
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTeacherNameText(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 138.h,
        vertical: 1.v,
      ),
      decoration: AppDecoration.fillCyan,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.v),
          //Text(
            //"Teacher Name",
            //style: theme.textTheme.titleLarge,
          //),
        ],
      ),
    );
  }
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.studentmodule);
  }
  onTapView2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teachermodule);
  }
}
