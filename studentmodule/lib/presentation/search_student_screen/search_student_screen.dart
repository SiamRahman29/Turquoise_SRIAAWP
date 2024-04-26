import 'package:flutter/material.dart';
import 'package:studentmodule3/core/app_export.dart';
import 'package:studentmodule3/widgets/custom_drop_down.dart';
import 'package:studentmodule3/widgets/custom_outlined_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: must_be_immutable
class SearchStudentScreen extends StatefulWidget {
  SearchStudentScreen({Key? key}) : super(key: key);

  @override
  _SearchStudentScreenState createState() => _SearchStudentScreenState();
}

class _SearchStudentScreenState extends State<SearchStudentScreen> {
  List<String> dropdownItemList = [
    "1 Itqaan",
    "1 Ikhlas",
    "1 Ihsaan",
    "2 Suhail",
    "2 Unais",
    "2 Saad",
    "3 Badar",
    "3 Uhud",
    "3 Hunain",
    "4 Al Banna",
    "4 Qutb",
    "4 Qardhawi",
    "5 Hanabil",
    " 5 Hanafi",
    "5 Syafie",
    "6 Nawawi",
    "6 Bukhari"
  ];

  List<String> dropdownItemList1 = ["Nothin"];

  List<String> filteredStudentList = [];

  String selectedClass = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildHomeRow(context),
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle543x430,
                      height: 43.v,
                      width: 430.h),
                  SizedBox(height: 24.v),
                  SizedBox(
                      height: 90.v,
                      width: 333.h,
                      child: Stack(alignment: Alignment.topLeft, children: [
                        CustomDropDown(
                            width: 333.h,
                            icon: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30.h, vertical: 25.v),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgFilter,
                                    height: 15.v,
                                    width: 25.h)),
                            hintText: "Pilih Kelas",
                            alignment: Alignment.bottomCenter,
                            items: dropdownItemList,
                            onChanged: (value) async {
                              setState(() {
                                selectedClass = value.toString();
                                filterStudentsByClass();
                              });
                            }),
                        
                        /*Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 68.h),
                                child: Text("Standard",
                                    style: theme.textTheme.titleLarge)))*/
                      ])),
                  SizedBox(height: 28.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 65.h,bottom: 5.h),
                          child: Text("Nama Pelajar",
                              style: theme.textTheme.titleLarge))),
                  Padding(
                      padding: EdgeInsets.only(left: 43.h, right: 54.h),
                      child: CustomDropDown(
                          icon: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30.h, vertical: 25.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgFilter,
                                  height: 15.v,
                                  width: 25.h)),
                          hintText: "Pilih Pelajar",
                          items: filteredStudentList,
                          onChanged: (value) {})),
                  Spacer(flex: 58),
                  CustomOutlinedButton(
                      width: 146.h,
                      text: "Tulis Laporan",
                      onPressed: () {
                        onTapWriteReport(context);
                      }),
                  Spacer(flex: 41),
                  SizedBox(height: 27.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 30.v,
                          width: 105.h,
                          margin: EdgeInsets.only(right: 13.h),
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapView(context);
                                    },
                                    child: Container(
                                        height:57.v,
                                        width: 105.h,
                                        decoration: BoxDecoration(
                                            color: appTheme.blueGray100)))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 21.h),
                                    child: Text("Back",
                                        style: theme.textTheme.headlineSmall)))
                          ])))
                ])),
            bottomNavigationBar: _buildStackWithVector(context)));
  }

  /// Section Widget
  Widget _buildHomeRow(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 20.v),
        decoration: AppDecoration.fillTeal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*
              CustomImageView(
                  imagePath: ImageConstant.imgHome3,
                  height: 42.v,
                  width: 50.h,
                  margin: EdgeInsets.only(top: 5.v, bottom: 10.v),
                  onTap: () {
                    onTapImgHomeThree(context);
                  }),*/
              Container(
                  height: 57.v,
                  width: 52.h,
                  margin: EdgeInsets.only(right: 9.h),
                  child: Stack(alignment: Alignment.center, children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            height: 52.adaptSize,
                            width: 52.adaptSize,
                            //decoration: BoxDecoration(
                              //  color: appTheme.black900,
                                //borderRadius: BorderRadius.circular(26.h))
                                )),
                    /*
                    CustomImageView(
                        imagePath: ImageConstant.imgDefaultPfp2,
                        height: 56.v,
                        width: 52.h,
                        alignment: Alignment.center,
                        onTap: () {
                          onTapImgDefaultPfpTwo(context);
                        })*/
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildStackWithVector(BuildContext context) {
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

  /// Navigates to the landingScreen when the action is triggered.
  onTapImgHomeThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landingScreen);
  }

  /// Navigates to the teacherInfoScreen when the action is triggered.
  onTapImgDefaultPfpTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.teacherInfoScreen);
  }

  /// Navigates to the reportGoodDeedScreen when the action is triggered.
  onTapWriteReport(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reportGoodDeedScreen);
  }

  /// Navigates to the landingScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landingScreen);
  }

  void filterStudentsByClass() async {
    // Simulating fetching data from Firestore
    // Replace this with your actual data fetching logic
    try {
      // Replace 'your-collection-name' with the actual name of your Firestore collection
      CollectionReference students = FirebaseFirestore.instance
          .collection('Turquoise')
          .doc('Students')
          .collection('PersonalInfo');

      // Fetch documents that match the selected class
      QuerySnapshot querySnapshot =
          await students.where('Class', isEqualTo: selectedClass).get();

      setState(() {
        filteredStudentList =
            querySnapshot.docs.map((doc) => doc['Name'].toString()).toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  /*
    filteredStudentList.clear();

    for (var student in studentData) {
      if (student["class"] == selectedClass) {
        filteredStudentList.add(student["name"]);
      }
    }
    */
}
