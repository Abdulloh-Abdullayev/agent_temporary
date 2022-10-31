import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agent/core/constants/api_const.dart';
import 'package:agent/core/utils/app_logger_util.dart';

class HttpService {
  HttpService.init() {
    if (_dio == null) {
      _dio = Dio();
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  static HttpService get to => Modular.get<HttpService>();

  Dio? _dio;

  Future<Response> post({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.post(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.post(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response> delete({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.delete(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.delete(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response> put({
    String? path,
    String? token,
    dynamic data,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.put(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );
        return response;
      } else {
        response = await _dio!.put(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return response;
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response> get({
    String? path,
    String? url,
    Map<String, dynamic>? parameters,
    String? token,
  }) async {
    late Response response;
    AppLoggerUtil.d(
        "API: ${APIConst.apiURL + (path ?? "")}\nParameters: $parameters\nToken: $token");
    try {
      if (url == null) {
        if (parameters == null) {
          if (token == null) {
            response = await _dio!.get(APIConst.apiURL + path!);
            return response;
          } else {
            response = await _dio!.get(
              APIConst.apiURL + path!,
              options: Options(
                headers: {"Authorization": "Bearer $token"},
              ),
            );
            return response;
          }
        }
        response = await _dio!.get(
          APIConst.apiURL + path!,
          queryParameters: parameters,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return response;
      } else {
        AppLoggerUtil.d("API: $url\n Parameters: $parameters");
        if (parameters == null) {
          response = await _dio!.get(url);
          return response;
        }
        response = await _dio!.get(url, queryParameters: parameters);
        return response;
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }
}
