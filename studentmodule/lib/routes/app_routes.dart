import 'package:flutter/material.dart';
import 'package:studentmodule3/presentation/landing_screen/landing_screen.dart';
import 'package:studentmodule3/presentation/teacher_info_screen/teacher_info_screen.dart';
import 'package:studentmodule3/presentation/search_student_screen/search_student_screen.dart';
import 'package:studentmodule3/presentation/report_good_deed_screen/report_good_deed_screen.dart';
import 'package:studentmodule3/presentation/generate_leaderboard_screen/generate_leaderboard_screen.dart';
import 'package:studentmodule3/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:turquoise/main.dart';

class AppRoutes {
  static const String landingScreen = '/landing_screen';

  static const String teacherInfoScreen = '/teacher_info_screen';

  static const String searchStudentScreen = '/search_student_screen';

  static const String reportGoodDeedScreen = '/report_good_deed_screen';

  static const String generateLeaderboardScreen =
      '/generate_leaderboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String aimodule = '/main';

  static Map<String, WidgetBuilder> routes = {
    landingScreen: (context) => LandingScreen(),
    teacherInfoScreen: (context) => TeacherInfoScreen(),
    searchStudentScreen: (context) => SearchStudentScreen(),
    reportGoodDeedScreen: (context) => ReportGoodDeedScreen(),
    generateLeaderboardScreen: (context) => GenerateLeaderboardScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    aimodule: (context) => MyApp()
  };
}
