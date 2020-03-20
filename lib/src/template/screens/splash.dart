import 'dart:async';

import 'package:app_flutter/src/template/screens/main_screen.dart';
import 'package:app_flutter/src/template/components/splash.dart';
import 'package:app_flutter/util/constants/constant_splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return new Timer(Duration(seconds: ConstantSplash.durationSecondsTimeout),
        handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: MainScreen(),
      ),
    );
    // Provider.of<HomeProvider>(context, listen: false).getFeeds();
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashComponent(),
    );
  }
}
