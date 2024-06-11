import 'package:injectable/injectable.dart';
import 'package:test_task/core/data/data_source/base_data_source.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';
import 'package:test_task/core/data/models/base/base_model.dart';
import 'package:test_task/core/data/models/base/base_response.dart';
import 'package:test_task/core/data/utilities/api/api.dart';
import 'package:test_task/core/data/utilities/api/content_api.dart';

@injectable
class ContentDataSource with BaseDataSource {
  ContentDataSource(Api api) {
    this.api = api.content;
  }

  late ContentApi api;

  Future<BaseResponse<BaseModel<List<AssetModel>>>> getAssets(
    int limit,
    int offset,
  ) =>
      getResult(() => api.getAssets(limit, offset));
}
