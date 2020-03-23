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
                  fontSize: 20, fontFamily: ConstantsApp.fontFamilyDencingFont),
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
                  onRefresh: () => homeProvider.loadBook,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: Center(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.recentBook.length + 1,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == homeProvider.recentBook.length) {}
                              Book book =
                                  homeProvider.recentBook.toList()[index];
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
                        height: 10,
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
                                scrollInfo.metrics.maxScrollExtent) {}
                          },
                          child: ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return ListTile(title: Text("Index : $index"));
                            },
                          ),
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeProvider.recentBook.length,
                        itemBuilder: (BuildContext context, int index) {
                          Book book = homeProvider.recentBook.toList()[index];
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
                    ],
                  ),
                ),
        );
      },
    );
  }
}
