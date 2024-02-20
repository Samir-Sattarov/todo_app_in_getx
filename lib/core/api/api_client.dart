import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'api_constants.dart';
import 'api_exceptions.dart';

abstract class ApiClient {
  Future<dynamic> get(String path, {Map<String, dynamic>? params});
  Future<dynamic> post(String path, Map<String, dynamic> data);
  Future<dynamic> patch(String path, Map<String, dynamic> data);
  Future<dynamic> delete(String path);
}

class ApiClientImpl extends ApiClient {
  // final AuthLocalDataSource localDataSource; // GET TOKEN FROM LOCAL DB
  final Dio client; // FOR CREATING REQUIEST

  ApiClientImpl(this.client);

  @override
  Future get(String path, {Map<String, dynamic>? params}) async {
    // String? token = await localDataSource.getSessionId();

    final Map<String, String> header = {
      // "Authorization": "Bearer $token",
    };

    final response = await client.get(
      getPath(path, params: params),
      options: buildCacheOptions(
        const Duration(
          days: 1,
        ),
        forceRefresh: true,
        maxStale: const Duration(days: 7),
        options: Options(contentType: "application/json", headers: header),
      ),
    );

    return _errorHandler(response);
  }

  @override
  Future delete(String path) async {}

  @override
  Future patch(String path, Map<String, dynamic> data) async {}

  @override
  Future post(String path, Map<String, dynamic> data) async {}

  _errorHandler(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 400 ||
        response.statusCode == 403 ||
        response.statusCode == 401 ||
        response.statusCode == 405 ||
        response.statusCode == 500 ||
        response.statusCode == 409) {
      String msg = "unknown_error";
      var resp = jsonDecode(utf8.decode(response.data));

      if (resp.containsKey("error")) {
        msg = resp["error"];
      } else if (resp.containsKey("message")) {
        var rsp = resp["message"];
        if (rsp.runtimeType == String) msg = resp["message"];
        if (rsp.runtimeType == List) msg = rsp[0];
      } else {
        msg = utf8
            .decode(response.data)
            .replaceAll("[", '')
            .replaceAll("]", '')
            .replaceAll("}", '')
            .replaceAll("{", '')
            .replaceAll("\\", '');
      }
      throw ExceptionWithMessage(msg);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  String getPath(String path, {Map<dynamic, dynamic>? params}) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return '${ApiConstants.baseApiUrl}$path$paramsString';
  }
}
