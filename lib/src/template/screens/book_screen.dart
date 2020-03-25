import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/src/core/providers/home_provider.dart';
import 'package:app_flutter/src/template/components/bookListItem_widget.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../../util/constants/constant_app.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  ScrollController _scrollController = ScrollController();
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
                  child: Column(
                    children: <Widget>[
                      Text(homeProvider.page.toString() +
                          " ----- " +
                          homeProvider.listBook.length.toString() +
                          " ----- " +
                          homeProvider.scrollLenght.toString() +
                          " ----- " +
                          homeProvider.maxScrollLenght.toString()),
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                    scrollInfo.metrics.maxScrollExtent &&
                                homeProvider.loadingUpdate) {
                              homeProvider.updateData(
                                  scrollInfo.metrics.pixels.toDouble(),
                                  scrollInfo.metrics.maxScrollExtent
                                      .toDouble());
                            }
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: homeProvider.listBook.length,
                            controller: _scrollController,
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
                      )
                    ],
                  )),
        );
      },
    );
  }
}
