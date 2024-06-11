import 'package:bloc/bloc.dart';
import 'package:test_task/core/data/utilities/bloc/base_state.dart';

abstract class BaseBloc<E, S> extends Bloc<E, BaseState<S>> {
  BaseBloc(super.initialState);
}
