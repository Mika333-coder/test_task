import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.getData() = GetData;

  const factory MainEvent.getNextPage() = GetNextPage;
}