import 'package:flutter/material.dart';
import 'package:farzad1463_s_application4/presentation/sttudent_screen/sttudent_screen.dart';
import 'package:farzad1463_s_application4/presentation/teacher_info_screen/teacher_info_screen.dart';
import 'package:farzad1463_s_application4/presentation/search_student_screen/search_student_screen.dart';
import 'package:farzad1463_s_application4/presentation/report_good_deed_screen/report_good_deed_screen.dart';
import 'package:farzad1463_s_application4/presentation/verify_good_deed_report_screen/verify_good_deed_report_screen.dart';
import 'package:farzad1463_s_application4/presentation/generate_leaderboard_screen/generate_leaderboard_screen.dart';
import 'package:farzad1463_s_application4/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String sttudentScreen = '/sttudent_screen';

  static const String teacherInfoScreen = '/teacher_info_screen';

  static const String searchStudentScreen = '/search_student_screen';

  static const String reportGoodDeedScreen = '/report_good_deed_screen';

  static const String verifyGoodDeedReportScreen =
      '/verify_good_deed_report_screen';

  static const String generateLeaderboardScreen =
      '/generate_leaderboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    sttudentScreen: (context) => SttudentScreen(),
    teacherInfoScreen: (context) => TeacherInfoScreen(),
    searchStudentScreen: (context) => SearchStudentScreen(),
    reportGoodDeedScreen: (context) => ReportGoodDeedScreen(),
    verifyGoodDeedReportScreen: (context) => VerifyGoodDeedReportScreen(),
    generateLeaderboardScreen: (context) => GenerateLeaderboardScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
