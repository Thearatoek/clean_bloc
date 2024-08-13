import 'package:dio/dio.dart';
import 'package:todo_app_clean_bloc_test/data/repository/api/dio_builder.dart';

enum RestMethod { get, post, put, patch, delete }

typedef Decoder<T extends Object> = T Function(Object? data);

class RestApiClient {
  RestApiClient({
    required this.dio,
    this.errorResponseMapperType =
        ApiClientDefaultSetting.defaultErrorResponseMapperType,
    this.successResponseMapperType =
        ApiClientDefaultSetting.defaultSuccessResponseMapperType,
  });

  final SuccessResponseMapperType successResponseMapperType;
  final ErrorResponseMapperType errorResponseMapperType;
  final Dio dio;

  Future<T?> request<D extends Object, T extends Object>({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Decoder<D>? decoder,
    SuccessResponseMapperType? successResponseMapperType,
    ErrorResponseMapperType? errorResponseMapperType,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    assert(
        method != RestMethod.get ||
            (successResponseMapperType ?? this.successResponseMapperType) ==
                SuccessResponseMapperType.plain ||
            decoder != null,
        'decoder must not be null if method is GET');
    try {
      final response = await _requestByMethod(
        method: method,
        path: path.startsWith(dio.options.baseUrl)
            ? path.substring(dio.options.baseUrl.length)
            : path,
        queryParameters: queryParameters,
        body: body,
        options: Options(
          headers: options?.headers,
          contentType: options?.contentType,
          responseType: options?.responseType,
          sendTimeout: options?.sendTimeout,
          receiveTimeout: options?.receiveTimeout,
        ),
        cancelToken: cancelToken,
      );

      if (response.data == null) {
        return null;
      }

      return BaseSuccessResponseMapper<D, T>.fromType(
        successResponseMapperType ?? this.successResponseMapperType,
      ).map(response: response.data, decoder: decoder);
    } catch (error) {
      throw DioExceptionMapper(
        BaseErrorResponseMapper.fromType(
          errorResponseMapperType ?? this.errorResponseMapperType,
        ),
      ).map(error);
    }
  }

  Future<Response<dynamic>> _requestByMethod({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
    CancelToken? cancelToken,
  }) {
    switch (method) {
      case RestMethod.get:
        return dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.post:
        return dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.patch:
        return dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.put:
        return dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.delete:
        return dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
    }
  }
}

class BaseSuccessResponseMapper<I extends Object, O extends Object> {
  BaseSuccessResponseMapper.fromType(
      SuccessResponseMapperType successResponseMapperType);

  map({required response, Decoder? decoder}) {}
}

class BaseErrorResponseMapper {
  static fromType(ErrorResponseMapperType errorResponseMapperType) {}
}

class DioExceptionMapper {
  DioExceptionMapper(fromType);

  map(Object error) {}
}
