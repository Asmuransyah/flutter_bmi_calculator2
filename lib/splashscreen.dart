import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator2/colors.dart';
import 'package:flutter_bmi_calculator2/homeapp.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeApp(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.warna3,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello Welcome',
              style: (TextStyle(
                  color: AppColor.warna1,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
            ),
            Image.asset('asset/gambar1.png'),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Body Mass Index',
              style: (TextStyle(
                color: AppColor.warna1,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
            )
          ],
        ),
      ),
    );
  }
}
