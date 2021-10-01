import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://dalileeom.com/cpdNew/app-api/",
        receiveDataWhenStatusError: true,
        headers: {'Accept': 'application/json'},
        queryParameters: {"type": "trader"}));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String lang = "ar",
    // String? token
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData (
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
        String lang="ar",
        // String? token
      }) async{
    dio!.options.queryParameters={
      "type":"trader",
      // "Authorization":token
    };

    return await dio!.post(url, queryParameters: {"type":"trader"}, data: data);

  }
}
