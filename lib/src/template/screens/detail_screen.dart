import 'package:app_flutter/src/core/models/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Details extends StatelessWidget {
  final Book book;
  final String imgTag;
  final String titleTag;
  final String authorTag;

  Details({
    Key key,
    @required this.book,
    @required this.imgTag,
    @required this.titleTag,
    @required this.authorTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${book.name}"),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: imgTag,
                          child: CachedNetworkImage(
                            imageUrl: "${book.thumnail}",
                            placeholder: (context, url) => Container(
                              height: 200,
                              width: 130,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Feather.x),
                            fit: BoxFit.cover,
                            height: 200,
                            width: 130,
                          ),
                        ),
                      ]))
            ]));
  }
}
