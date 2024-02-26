import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/resume_atributes.dart';
import 'package:resume_builder_app/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer.periodic(const Duration(seconds: 5), (timer) {
    //   Navigator.of(context).pushNamed(Routes.home_page);
    // });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacementNamed(Routes.home_page);
      },
    );
    // Future.delayed(
    //   const Duration(seconds: 5),
    //   () {
    //     Navigator.of(context).pushReplacementNamed(Routes.home_page);
    //   },
    // );
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Container(
      alignment: Alignment.center,
      color: const Color(0xff6054C1),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            "${imagePath}splash.png",
            height: h * 0.25,
          ),
          Spacer(),
          const LinearProgressIndicator(
            minHeight: 5,
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }
}
