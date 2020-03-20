import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:app_flutter/util/constants/constant_splash.dart';
import 'package:flutter/material.dart';

class SplashComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ConstantSplash.icon,
          color: Theme.of(context).accentColor,
          size: ConstantSplash.sizeIcon,
        ),
        SizedBox(height: ConstantSplash.heightSizeBox),
        Text(
          "${ConstantApp.appName}",
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: ConstantSplash.fontSizeText,
              fontWeight: FontWeight.bold,
              fontFamily: ConstantApp.fontFamilyDencingFont),
        )
      ],
    ));
  }
}
