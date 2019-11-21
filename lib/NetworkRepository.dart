
import 'package:dio/dio.dart';

class NetworkRepository {
  Future<String> getRequest(String url) async {
    var dio = Dio();
    print(url.toString());
    Response response = await dio.get(url);
    print(response.toString());
    return response.data.toString();
  }
  dynamic requestInterceptor(RequestOptions options) async {
    return options;
  }

}
