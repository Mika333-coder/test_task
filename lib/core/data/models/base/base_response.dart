import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/core/data/models/base/base_error_model.dart';

part 'base_response.freezed.dart';

/// Base Response Model
@Freezed(genericArgumentFactories: true, toJson: false, fromJson: false)
class BaseResponse<T> with _$BaseResponse<T> {
  const BaseResponse._();

  /// if success from response
  const factory BaseResponse.success({
    @JsonKey(name: 'data') T? data,
  }) = BaseResponseSuccess;

  /// if error from response
  const factory BaseResponse.error({
    @JsonKey(name: 'model') required BaseErrorModel model,
  }) = BaseResponseError;
}
