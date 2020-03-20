import 'package:app_flutter/src/core/providers/app_provider.dart';
import 'package:app_flutter/src/core/providers/home_provider.dart';
import 'package:app_flutter/src/template/screens/splash_screen.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: ConstantsApp.appName,
          theme: appProvider.themeData,
          home: SplashScreen(),
        );
      },
    );
  }
}
