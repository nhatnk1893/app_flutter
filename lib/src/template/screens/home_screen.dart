import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/src/core/providers/app_provider.dart';
import 'package:app_flutter/src/core/providers/home_provider.dart';
import 'package:app_flutter/src/template/components/bookCart_widget.dart';
import 'package:app_flutter/src/template/components/bookListItem_widget.dart';
import 'package:app_flutter/util/constants/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

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
                  onRefresh: () => homeProvider.loadBook,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: SwitchListTile(
                          secondary: Icon(
                            Feather.moon,
                          ),
                          title: Text("Dark Mode"),
                          onChanged: (v) {
                            if (v) {
                              Provider.of<AppProvider>(context, listen: false)
                                  .setTheme(ConstantsApp.darkTheme, "dark");
                            } else {
                              Provider.of<AppProvider>(context, listen: false)
                                  .setTheme(ConstantsApp.lightTheme, "light");
                            }
                          },
                          value: Provider.of<AppProvider>(context).themeData ==
                                  ConstantsApp.lightTheme
                              ? false
                              : true,
                        ),
                      ),
                      Text(
                        homeProvider.recentBook.length.toString(),
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                      Container(
                        height: 200,
                        child: Center(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.recentBook.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
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
                              author: book.author.map((e) => e.name).toList(),
                              desc: book.description,
                              book: book,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            homeProvider.setLoading(false);
          }),
        );
      },
    );
  }
}
