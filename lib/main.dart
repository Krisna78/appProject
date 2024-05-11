import 'package:flutter/material.dart';
import 'package:project_team_3/Auth/login_page.dart';
import 'package:project_team_3/controllers/global.dart';
import 'package:project_team_3/home/cources/detailCource.dart';
import 'package:project_team_3/home/home_page.dart';
import 'package:project_team_3/home/notifications_details.dart';
import 'package:get/get.dart';

void main() {
  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Codinggo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFBFBFBFB),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 127, 63)),
        datePickerTheme: const DatePickerThemeData(
          surfaceTintColor: Color.fromARGB(150, 255, 127, 63),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        // "/detailCource": (context) => DetailCource(),
        "/notification_detail": (context) => NotificationDetails(),
      },
    );
  }
}
