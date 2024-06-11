import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.loading() = _$BaseStateLoading;

  const factory BaseState.hideLoading() = _$BaseStateHideLoading;

  const factory BaseState.error({
    required String msg,
    String? errorCode,
  }) = _$BaseStateError;

  const factory BaseState.other(T data) = _BaseStateOther;
}

extension BaseStateExt<T> on BaseState<T> {
  bool buildWhen({bool Function(T)? isDraw}) => maybeWhen(
        orElse: () => false,
        other: (state) => isDraw?.call(state) ?? true,
      );

  bool listenWhen({bool Function(T)? isListen}) => maybeWhen(
        orElse: () => true,
        other: (state) => isListen?.call(state) ?? false,
      );
}
