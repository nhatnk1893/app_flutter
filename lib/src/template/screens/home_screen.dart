import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/src/core/providers/home_provider.dart';
import 'package:app_flutter/src/template/components/bookCart_widget.dart';
import 'package:app_flutter/src/template/components/bookListItem_widget.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider homeProvider, Widget child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "${ConstantsApp.appName}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
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
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              Book book = homeProvider.listAllBook
                                  .take(10)
                                  .toList()[index];
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
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeProvider.listAllBook.length,
                        itemBuilder: (BuildContext context, int index) {
                          Book book = homeProvider.listAllBook.toList()[index];

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
