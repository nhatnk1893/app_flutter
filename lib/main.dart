import 'package:app_flutter/src/template/screens/splash.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantApp.appName,
      home: SplashScreen(),
    );
  }
}
