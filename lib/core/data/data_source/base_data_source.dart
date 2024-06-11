import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task/core/data/models/base/base_error_model.dart';
import 'package:test_task/core/data/models/base/base_response.dart';
import 'package:test_task/core/data/utilities/l10n/l10n_service.dart';
import 'package:test_task/core/data/utilities/log/logger_service.dart';

mixin BaseDataSource {
  Future<BaseResponse<T>> getResult<T>(
    Future<HttpResponse<T>> Function() call, {
    bool refreshCurrentToken = true,
  }) async {
    try {
      final connectivity = await (Connectivity().checkConnectivity());

      if (ConnectivityResult.none == connectivity) {
        return const BaseResponse.error(
          model: BaseErrorModel(detail: 'Check your internet connection.'),
        );
      }

      final response = await call.call();

      final statusCode = response.response.statusCode ?? -1;
      if (statusCode == -1) {
        return const BaseResponse.error(
          model: BaseErrorModel(detail: 'Unknown Error'),
        );
      }
      if (statusCode >= 200 && statusCode < 300) {
        final body = response.data;
        return BaseResponse.success(data: body);
      } else {
        if (kDebugMode) print('statusCode => $statusCode');
        return BaseResponse.error(
          model: BaseErrorModel(detail: response.response.statusMessage ?? 'Unknown Error'),
        );
      }
    } on DioException catch (e, s) {
      debugPrint('asd');
      if (kDebugMode) LoggerService().d('Error is $e, stack $s');

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const BaseResponse.error(
          model: BaseErrorModel(detail: 'Connection time out.'),
        );
      } else if (e.type == DioExceptionType.badResponse) {
        final errorModel = BaseErrorModel.fromJson(e.response?.data ?? {});

        return BaseResponse.error(
          model: errorModel,
        );
      } else {
        return BaseResponse.error(
          model: BaseErrorModel(detail: AppLocale.current.somethingWentWrong),
        );
      }
    } catch (e, s) {
      LoggerService().d('Error is $e, stack $s');
      return BaseResponse.error(
        model: BaseErrorModel(detail: e.toString()),
      );
    }
  }
}
