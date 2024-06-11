import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/data/utilities/bloc/base_state.dart';
import 'package:test_task/core/data/utilities/bloc/bloc_factory.dart';
import 'package:test_task/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:test_task/core/presentation/views/main/bloc/main_bloc.dart';
import 'package:test_task/core/presentation/views/main/bloc/main_event.dart';
import 'package:test_task/core/presentation/views/main/bloc/main_state.dart';
import 'package:test_task/core/presentation/views/main/widgets/asset_widget.dart';
import 'package:test_task/core/presentation/widgets/app_loading_widget.dart';
import 'package:test_task/core/presentation/widgets/app_scaffold.dart';
import 'package:test_task/core/presentation/widgets/base/base_state_mixin.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with BaseStateMixin {
  ScrollController? _scrollController;
  VoidCallback? _scrollListener;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener ?? () {});
    _scrollListener = null;
    _scrollController?.dispose();
    _scrollController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: AppScaffold(
        top: true,
        bottom: true,
        child: BlocProvider(
          create: (context) {

            final bloc = context.read<BlocFactory>().create<MainBloc>()
              ..add(const MainEvent.getData());
            _scrollListener = () {
              if ((_scrollController?.position.maxScrollExtent ?? 0) - (56.sp * 5) <= (_scrollController?.offset ?? 0)) {
                bloc.add(const MainEvent.getNextPage());
              }
            };
            _scrollController?.addListener(_scrollListener ?? () {});
            return bloc;
          },
          child: BlocConsumer<MainBloc, BaseState<MainState>>(
            buildWhen: (_, cur) => cur.buildWhen(isDraw: (state) => state.buildWhen),
            listenWhen: (_, cur) => cur.listenWhen(isListen: (state) => state.listenWhen),
            listener: (context, state) => state.whenOrNull(
              loading: () => showLoading(),
              hideLoading: () => hideLoading(),
              error: (msg, _) => showErrorDialog(msg: msg),
            ),
            builder: (context, state) =>
                state.whenOrNull(
                  other: (nestedState) => nestedState.when(
                    draw: (assets, isFetching) => ListView.builder(
                      controller: _scrollController,
                      itemCount: assets.length + (isFetching ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == assets.length) {
                          return AppLoadingWidget(color: context.colors.black,).paddingSymmetric(vertical: 20.h);
                        }
                        final asset = assets[index];
                        return AssetWidget(asset: asset);
                      },
                    ),
                  ),
                ) ??
                const AppLoadingWidget(),
          ),
        ),
      ),
    );
  }
}
