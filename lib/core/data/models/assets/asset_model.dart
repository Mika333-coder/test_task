import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'asset_model.freezed.dart';

part 'asset_model.g.dart';

@freezed
class AssetModel with _$AssetModel {
  const factory AssetModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'symbol') String? symbol,
    @JsonKey(name: 'priceUsd') String? priceUsd,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, Object?> json) => _$AssetModelFromJson(json);
}

extension AssetModelExt on AssetModel {
  String get price {
    NumberFormat formatter = NumberFormat('#,##0.00');
    final double priceUsdNumber = priceUsd?.toDoubleOrNull() ?? 0;
    return '\$${formatter.format(priceUsdNumber)}';
  }
}
