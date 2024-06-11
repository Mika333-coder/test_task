import 'package:injectable/injectable.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';
import 'package:test_task/core/data/models/base/base_model.dart';
import 'package:test_task/core/data/models/base/base_response.dart';
import 'package:test_task/core/data/repositories/content_repository.dart';

@injectable
class GetAssetsUsecase {
  GetAssetsUsecase({
    required this.repository,
  });

  final ContentRepository repository;

  Future<BaseResponse<BaseModel<List<AssetModel>>>> call({int limit = 20, int offset = 0}) =>
      repository.getAssets(limit, offset);
}
