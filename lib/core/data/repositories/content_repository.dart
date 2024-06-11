import 'package:injectable/injectable.dart';
import 'package:test_task/core/data/data_source/content_datasource.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';
import 'package:test_task/core/data/models/base/base_model.dart';
import 'package:test_task/core/data/models/base/base_response.dart';

@injectable
class ContentRepository {
  ContentRepository(
    this.dataSource,
  );

  final ContentDataSource dataSource;

  Future<BaseResponse<BaseModel<List<AssetModel>>>> getAssets(
    int limit,
    int offset,
  ) =>
      dataSource.getAssets(limit, offset);
}
