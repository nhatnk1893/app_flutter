import 'dart:async';
import 'package:app_flutter/src/core/providers/home_provider.dart';
import 'package:app_flutter/src/template/components/splash_widget.dart';
import 'package:app_flutter/src/template/screens/main_screen.dart';
import 'package:app_flutter/util/constants/constant_splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
    Provider.of<HomeProvider>(context, listen: false).loadBook;
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashWidget(),
    );
  }
}
