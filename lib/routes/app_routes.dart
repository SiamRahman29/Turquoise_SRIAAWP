import 'package:flutter/material.dart';
import 'package:Turquoise/presentation/home_page_screen/home_page_screen.dart';
import 'package:Turquoise/presentation/register_page_screen/register_page_screen.dart';
import 'package:studentmodule3/main.dart';
import 'package:untitled/teacher_landing.dart';

class AppRoutes {
  static const String homePageScreen = '/home_page_screen';
  static const String studentmodule = '/main';
  static const String teachermodule = '/teacher_landing';
  static const String registerPageScreen = '/register_page_screen';

  static Map<String, WidgetBuilder> routes = {
    homePageScreen: (context) => HomePageScreen(),
    registerPageScreen: (context) => RegisterPageScreen(),
    studentmodule: (context) => MyApp(),
    teachermodule: (context) => MyApp2()
  };
}
