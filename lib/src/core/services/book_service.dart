import 'dart:convert';

import 'package:app_flutter/src/core/models/book.dart';
import 'package:app_flutter/util/constants/constant_urlApi.dart';
import 'package:dio/dio.dart';

class BookService {
  Future<List<Book>> get recentTopBook async {
    var dio = Dio();
    Response response = await dio.get(ConstantsUrlApi.urlMockApiStore);
    List responseJsonTopBook = json.decode(response.data);
    List<Book> listTopBook =
        responseJsonTopBook.map((m) => new Book.fromJson(m)).toList();
    return listTopBook;
  }

  Future<List<Book>> recentListBook(int intPage) async {
    var dio = Dio();
    Response response = await dio
        .get(ConstantsUrlApi.urlMockApiStore + "?page=$intPage&limit=30");
    List responseJsonListBook = json.decode(response.data);
    List<Book> listBook =
        responseJsonListBook.map((m) => new Book.fromJson(m)).toList();
    return listBook;
  }
}
