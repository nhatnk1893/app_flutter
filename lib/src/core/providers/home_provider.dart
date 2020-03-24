import 'dart:convert';
import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/util/constants/constant_urlApi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List<Book> topBook = new List<Book>();
  bool loading = true;

  // Contructor
  HomeProvider() {
    fetchData;
  }

  Future<List<Book>> get fetchData async {
    setLoading(true);
    http.Response response = await http.get(ConstantsUrlApi.urlMockApiStore);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      topBook = responseJson.map((m) => new Book.fromJson(m)).toList();
      setTopBook(topBook);
      setLoading(false);
    } else {
      setLoading(false);
    }
    return topBook;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setTopBook(value) {
    topBook = value;
    notifyListeners();
  }
}
