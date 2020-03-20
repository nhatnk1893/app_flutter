import 'dart:convert';
import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/util/constants/constant_urlApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    loadBook;
  }

  String message;
  List<Book> recentBook = new List<Book>();
  bool loading = true;

  Future<List<Book>> get loadBook async {
    setLoading(true);
    notifyListeners();
    http.Response response = await http.get(ConstantsUrlApi.urlMockApiStore);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      recentBook = responseJson.map((m) => new Book.fromJson(m)).toList();
      setRecent(recentBook);
      setLoading(false);
    } else {
      setLoading(true);
    }
    return recentBook;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setMessage(value) {
    message = value;
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
    notifyListeners();
  }

  String getMessage() {
    return message;
  }

  void setRecent(value) {
    recentBook = value;
    notifyListeners();
  }
}
