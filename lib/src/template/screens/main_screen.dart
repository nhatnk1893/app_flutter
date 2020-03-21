import 'package:app_flutter/src/core/providers/app_provider.dart';
import 'package:app_flutter/src/template/screens/home_screen.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => null,
        child: Scaffold(
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: <Widget>[
                HomeScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Theme.of(context).accentColor,
              unselectedItemColor: Colors.grey[500],
              elevation: 20,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.home,
                  ),
                  title: SizedBox(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.compass,
                  ),
                  title: SizedBox(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.settings,
                  ),
                  title: SizedBox(),
                ),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Provider.of<AppProvider>(context, listen: false).changeMode();
              },
              label: Text(
                  Provider.of<AppProvider>(context, listen: false).labelMode),
              icon: Provider.of<AppProvider>(context, listen: false).iconMode,
            )));
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
