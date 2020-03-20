import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    checkTheme();
  }

  ThemeData themeData = ConstantsApp.lightTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r =
        prefs.getString("theme") == null ? "light" : prefs.getString("theme");

    if (r == "light") {
      t = ConstantsApp.lightTheme;
      setTheme(ConstantsApp.lightTheme, "light");
    } else {
      t = ConstantsApp.darkTheme;
      setTheme(ConstantsApp.darkTheme, "dark");
    }

    return t;
  }

  void setTheme(value, c) {
    themeData = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("theme", c).then((val) {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: c == "dark"
              ? ConstantsApp.darkPrimary
              : ConstantsApp.lightPrimary,
          statusBarIconBrightness:
              c == "dark" ? Brightness.light : Brightness.dark,
        ));
      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return themeData;
  }
}
