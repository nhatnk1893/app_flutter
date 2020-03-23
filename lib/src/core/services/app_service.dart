import 'package:dio/dio.dart';

class AppService {
  Future<bool> checkRecent(String url) async {
    var dio = Dio();
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
