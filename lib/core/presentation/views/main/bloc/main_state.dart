import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.draw(List<AssetModel> data, bool isFetching) = _MainStateDraw;
}

extension MainStateExt on MainState {
  bool get buildWhen => maybeWhen(orElse: () => false, draw: (_, __) => true);

  bool get listenWhen => !buildWhen;
}