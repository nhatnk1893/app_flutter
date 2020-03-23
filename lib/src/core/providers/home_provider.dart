import 'dart:convert';
import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/src/core/services/app_service.dart';
import 'package:app_flutter/src/core/services/book_service.dart';
import 'package:app_flutter/util/constants/constant_urlApi.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  AppService _appService = new AppService();
  BookService _bookService = new BookService();
  List<Book> recentBook = new List<Book>();
  List<Book> topBook = new List<Book>();
  List<Book> listBook = new List<Book>();
  bool loading = true;
  String message;

  // Contructor
  HomeProvider() {
    loadBook;
  }

  Future<List<Book>> get loadBook async {
    bool check;
    setLoading(true);
    _appService
        .checkRecent(ConstantsUrlApi.urlMockApiStore)
        .then((value) => check = value)
        .catchError((e) {
      throw (e);
    });
    setLoading(false);
    if (check == false) {
    } else {
      _bookService.recentTopBook.then((value) => recentBook = value);
      setTopBook(recentBook);
    }
    return recentBook;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setTopBook(value) {
    topBook = value;
    notifyListeners();
  }

  void setListBook(value) {
    listBook = value;
    notifyListeners();
  }
}
