import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_clean_bloc_test/shared/constants/url_constants.dart';

import '../../../../helper/exception/app_exception.dart';

enum RestMethod { get, post, put, patch, delete }

typedef Decoder<T extends Object> = T Function(Object? data);

class RestApiClient {
  final Dio dio;

  RestApiClient({required this.dio});

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get(
        UrlConstants.currentWeather
            .replaceAll("{zipCode}", "?q=11211&key=${UrlConstants.apiKey}"),
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: {
          'Accept': 'application/json',
        }),
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
