import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';
import 'package:test_task/core/data/models/base/base_error_model.dart';
import 'package:test_task/core/data/usecases/content/get_assets_usecase.dart';
import 'package:test_task/core/data/utilities/bloc/base_bloc.dart';
import 'package:test_task/core/data/utilities/bloc/base_state.dart';
import 'package:test_task/core/presentation/views/main/bloc/main_event.dart';
import 'package:test_task/core/presentation/views/main/bloc/main_state.dart';

@injectable
class MainBloc extends BaseBloc<MainEvent, MainState> {
  MainBloc(this._getAssetsUsecase) : super(const BaseState.hideLoading()) {
    on<GetData>((event, emit) async {
      isEnded = false;
      isLoading = true;
      assets = [];
      offset = 0;
      if (offset == 0) {
        emit(const BaseState.loading());
      }
      await fetchData(emit);
    });
    on<GetNextPage>((event, emit) async {
      if (isLoading || isEnded) return;
      offset += limit;
      isLoading = true;
      if (offset == 0) {
        emit(const BaseState.loading());
      }
      await fetchData(emit);
    });
  }

  Future fetchData(Emitter<BaseState<MainState>> emit) async {
    emit(_drawState);
    (await _getAssetsUsecase(limit: limit, offset: offset)).when(
      success: (data) {
        isEnded = data?.result?.isEmpty == true;
        assets.addAll(data?.result ?? []);
      },
      error: (error) => emit(BaseState.error(msg: error.errorMessage)),
    );
    emit(const BaseState.hideLoading());
    isLoading = false;
    emit(_drawState);
  }

  BaseState<MainState> get _drawState => BaseState.other(MainState.draw(assets, isLoading));

  final GetAssetsUsecase _getAssetsUsecase;

  List<AssetModel> assets = [];

  int get limit => 15;

  int offset = 0;

  bool isLoading = false;
  bool isEnded = false;
}
