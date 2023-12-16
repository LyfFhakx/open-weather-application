import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_weather_application/src/common/theme/font_theme.dart';

import '../auth_page/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AuthPage()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff0700FF), Color(0xff000000)],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "WEATHER SERVICE",
                    textAlign: TextAlign.center,
                    style: FontTheme.hBold.style(),
                  ),
                ),
              ),
              Text(
                "dawn is coming soon",
                style: FontTheme.bI.style(),
              ),
              SizedBox(height: 86.h,)
            ],
          ),
        ),
      ),
    );
  }
}
