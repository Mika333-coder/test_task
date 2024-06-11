import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.freezed.dart';
part 'base_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseModel<T> with _$BaseModel<T> {
  const factory BaseModel({
    @JsonKey(name: 'data') T? result,
  }) = _BaseModel;

  factory BaseModel.fromJson(
      Map<String, Object?> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$BaseModelFromJson(json, fromJsonT);
}

