
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator2/colors.dart';
import 'package:flutter_bmi_calculator2/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColor.warna4,
        colorScheme: const ColorScheme.light(
          primary: AppColor.warna3,
          secondary: AppColor.warna4,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.warna3,
          foregroundColor: AppColor.warna1,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
