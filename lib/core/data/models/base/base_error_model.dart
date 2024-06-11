import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_error_model.freezed.dart';
part 'base_error_model.g.dart';

@freezed
class BaseErrorModel with _$BaseErrorModel {
  const factory BaseErrorModel({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'detail') String? detail,
    @JsonKey(name: 'title') String? title,
  }) = _BaseErrorModel;

  factory BaseErrorModel.fromJson(Map<String, Object?> json) => _$BaseErrorModelFromJson(json);
}

extension BaseErrorModelExt on BaseErrorModel {
  String get errorMessage => detail ?? title ?? '';
}
