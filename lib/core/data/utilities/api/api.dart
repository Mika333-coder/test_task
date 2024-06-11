import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/data/utilities/api/content_api.dart';
import 'package:test_task/core/data/utilities/api/interceptors/logging_interceptor.dart';

/// Api Provider
@injectable
class Api {
  /// Default constructor
  Api();

  final _dio = Dio(
    BaseOptions(
      receiveTimeout: const Duration(milliseconds: 60000),
      connectTimeout: const Duration(milliseconds: 60000),
      contentType: 'application/json',
    ),
  )..interceptors.addAll([
      if (!kReleaseMode) LoggingInterceptor(),
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
      ),
    ]);

  final _baseUrl = 'https://api.coincap.io';
  ContentApi get content => ContentApi(_dio, baseUrl: _baseUrl);
}
