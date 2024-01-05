import 'package:flutter/material.dart';
import 'package:studentmodule3/core/app_export.dart';
import 'package:studentmodule3/widgets/custom_drop_down.dart';
import 'package:studentmodule3/widgets/custom_outlined_button.dart';
import 'package:studentmodule3/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class ReportGoodDeedScreen extends StatelessWidget {
  ReportGoodDeedScreen({Key? key}) : super(key: key);

  List<String> dropdownItemList = ["Salaam", "Cleaning", "Help others", "Show kindness", "Compassion"];

  TextEditingController vectorTwoController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildRowWithHomeAndProfile(context),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle51,
                height: 43.v,
                width: 430.h,
              ),
              SizedBox(height: 29.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 70.h),
                  child: Text("Good Deed", style: theme.textTheme.headlineSmall),
                ),
              ),
              SizedBox(height: 1.v),
              Padding(
                padding: EdgeInsets.only(left: 44.h, right: 53.h),
                child: CustomDropDown(
                  icon: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 25.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFilter,
                      height: 15.v,
                      width: 25.h,
                    ),
                  ),
                  hintText: "Choose Deed",
                  items: dropdownItemList,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 29.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 81.h),
                  child: Text("Date", style: theme.textTheme.headlineSmall),
                ),
              ),
              SizedBox(height: 1.v),
              Padding(
                padding: EdgeInsets.only(left: 44.h, right: 53.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: vectorTwoController,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(width: 10.h),
                    Container(
                      height: 56.v,
                      width: 60.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: appTheme.black900),
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Center(
                        child: Text(
                          "DD/MM/YY",
                          style: theme.textTheme.caption!.copyWith(color: appTheme.black900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 21.v),
              _buildStackWithRemarks(context),
              SizedBox(height: 87.v),
              CustomOutlinedButton(
                width: 146.h,
                text: "Submit",
                buttonTextStyle: CustomTextStyles.headlineSmallBold,
                onPressed: () {
                  onTapSubmit(context);
                },
              ),
              Spacer(),
              SizedBox(height: 24.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 32.v,
                  width: 105.h,
                  margin: EdgeInsets.only(right: 24.h),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 27.v,
                        width: 105.h,
                        decoration: BoxDecoration(color: appTheme.blueGray100),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {
                          onTapTxtBack(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 21.h),
                          child: Text("Back", style: theme.textTheme.headlineSmall),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildStackWithVector(context),
      ),
    );
  }

  Widget _buildRowWithHomeAndProfile(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 20.v),
      decoration: AppDecoration.fillTeal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgHome3,
            height: 42.v,
            width: 50.h,
            margin: EdgeInsets.only(top: 7.v, bottom: 8.v),
            onTap: () {
              onTapImgHomeThree(context);
            },
          ),
          Container(
            height: 56.v,
            width: 52.h,
            margin: EdgeInsets.only(right: 1.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 52.adaptSize,
                    width: 52.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.black900,
                      borderRadius: BorderRadius.circular(26.h),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgDefaultPfp2,
                  height: 56.v,
                  width: 52.h,
                  alignment: Alignment.center,
                  onTap: () {
                    onTapImgDefaultPfpTwo(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStackWithRemarks(BuildContext context) {
    return SizedBox(
      height: 143.v,
      width: 383.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Text(
              "Remarks",
              style: CustomTextStyles.headlineSmallBold,
            ),
          ),
          SizedBox(height: 8.v),
          CustomTextFormField(
            controller: remarksController,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  Widget _buildStackWithVector(BuildContext context) {
    return Container(
      height: 13.v,
      width: 37.h,
      margin: EdgeInsets.only(left: 198.h, right: 195.h, bottom: 13.v),
      decoration: AppDecoration.fillGray700,
      child: CustomImageView(
        imagePath: ImageConstant.imgVector1,
        height: 13.v,
        width: 37.h,
        alignment: Alignment.center,
      ),
    );
  }

  void onTapImgHomeThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landingScreen);
  }

  void onTapImgDefaultPfpTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherInfoScreen);
  }

  void onTapSubmit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.generateLeaderboardScreen);
  }

  void onTapTxtBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchStudentScreen);
  }
}