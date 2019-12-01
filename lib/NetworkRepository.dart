
import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkRepository {
  Future<String> getRequest(String url) async {
    var dio = Dio();
    print(url.toString());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          print("REQUEST[${options?.method}] => PATH: ${options?.path}");
          return options; //continue
        },
        onResponse:(Response response) async {
          print("RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
          return response; // continue
        },
        onError: (DioError err) async {
          print("ERROR[${err.toString()}] => PATH: ${err?.request?.path}");
          return  err;//continue
        }
    ));
    Response response = await dio.get(url);
//    print(json.encode(response.data));
    return json.encode(response.data);
  }
  dynamic requestInterceptor(RequestOptions options) async {
    return options;
  }

}
