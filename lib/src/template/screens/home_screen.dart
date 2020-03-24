import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/src/core/providers/home_provider.dart';
import 'package:app_flutter/src/template/components/bookCart_widget.dart';
import 'package:app_flutter/src/template/components/bookListItem_widget.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../../util/constants/constant_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "${ConstantsApp.appName}",
              style: TextStyle(
                  fontSize: 28, fontFamily: ConstantsApp.fontFamilyDencingFont),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Feather.search), onPressed: () {}),
              IconButton(icon: Icon(Feather.more_vertical), onPressed: () {})
            ],
          ),
          body: homeProvider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => homeProvider.fetchData,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: Center(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.topBook.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == homeProvider.topBook.length) {}
                              Book book = homeProvider.topBook.toList()[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: BookCard(
                                  img: book.thumnail,
                                  book: book,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: Center(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.topBook.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              Book book = homeProvider.topBook[index];

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   PageTransition(
                                      //     type: PageTransitionType.rightToLeft,
                                      //     child: Genre(
                                      //       title: "${link.title}",
                                      //       url: Api.baseURL + link.href,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "${book.name}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Recently Added",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                    scrollInfo.metrics.maxScrollExtent &&
                                homeProvider.loadingUpdate) {
                              print("loadmore");
                              homeProvider.updateinitPage();
                              homeProvider.updateData();
                            }
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            shrinkWrap: true,
                            // physics: ScrollableScrollPhysics(),
                            itemCount: homeProvider.listBook.length,
                            itemBuilder: (BuildContext context, int index) {
                              Book book = homeProvider.listBook.toList()[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: BookListItem(
                                  img: book.thumnail,
                                  title: book.name,
                                  author: book.author,
                                  desc: book.description,
                                  book: book,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: homeProvider.loadingUpdate ? 50.0 : 0,
                        color: Colors.transparent,
                        child: Center(
                          child: new CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
