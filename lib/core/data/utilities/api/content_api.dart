import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';
import 'package:test_task/core/data/models/base/base_model.dart';

part 'content_api.g.dart';

@RestApi()
abstract class ContentApi {
  /// Factory constructor
  factory ContentApi(
    Dio dio, {
    String baseUrl,
  }) = _ContentApi;

  @GET('/v2/assets')
  Future<HttpResponse<BaseModel<List<AssetModel>>>> getAssets(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );
}
