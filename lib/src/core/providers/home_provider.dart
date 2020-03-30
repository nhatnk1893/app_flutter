import 'package:app_flutter/src/core/models/book.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List<Book> topBook = new List<Book>();
  List<Book> listBook = new List<Book>();
  bool loading = true;
  bool loadingUpdate = true;
  int page = 1;
  double scrollLenght = 0.0;
  double maxScrollLenght = 0.0;
}
