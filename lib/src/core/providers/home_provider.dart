import 'dart:convert';

import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/util/constants/constant_urlApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fetchData;
  }

  List<Book> listAllBook = new List<Book>();
  bool loading = true;

  Future<List<Book>> get fetchData async {
    setLoading(true);
    http.Response response = await http.get(ConstantsUrlApi.urlMockApiStore);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      listAllBook = responseJson.map((m) => new Book.fromJson(m)).toList();
      setRecent(false);
      setLoading(false);
    } else {
      setLoading(true);
    }
    return listAllBook;
  }

  void setRecent(value) {
    listAllBook = value;
    notifyListeners();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }
}
