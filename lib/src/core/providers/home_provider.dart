import 'dart:convert';
import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/util/constants/constant_urlApi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List<Book> topBook = new List<Book>();
  List<Book> listBook = new List<Book>();
  bool loading = true;
  bool loadingUpdate = true;
  int page = 1;
  double scrollLenght = 0.0;
  double maxScrollLenght = 0.0;
  // Contructor
  HomeProvider() {
    fetchData;
    fetchDataStoreNewUpdate;
  }

  Future<List<Book>> get fetchData async {
    setLoading(true);
    http.Response response = await http.get(ConstantsUrlApi.urlMockApiTopStore);
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

  Future<List<Book>> get fetchDataStoreNewUpdate async {
    http.Response response = await http
        .get(ConstantsUrlApi.urlMockApiListStore + "page=1&&limit=10");
    List responseJson = json.decode(response.body);
    listBook = responseJson.map((m) => new Book.fromJson(m)).toList();
    setListBook(listBook);
    return listBook;
  }

  void updateData(double c, double d) async {
    setLoadingUpdate(false);
    if (page < (listBook.length / 10) + 2) {
      updateinitPage();
      http.Response response = await http
          .get(ConstantsUrlApi.urlMockApiListStore + "page=$page&&limit=10");
      List responseJson = json.decode(response.body);
      updateListData(responseJson.map((m) => new Book.fromJson(m)).toList());
      setLenght(c);
      setMaxLenght(d);
      setLoadingUpdate(true);
      return;
    }
    setLoadingUpdate(false);
  }

  void updateinitPage() {
    page = page + 1;
    notifyListeners();
  }

  void updateListData(value) {
    listBook.addAll(value);
    notifyListeners();
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

  void setLoadingUpdate(value) {
    loadingUpdate = value;
    notifyListeners();
  }

  void setLenght(value) {
    scrollLenght = value;
    notifyListeners();
  }

  void setMaxLenght(value) {
    maxScrollLenght = value;
    notifyListeners();
  }
}
