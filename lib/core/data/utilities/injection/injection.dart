import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/data/utilities/injection/injection.config.dart';

/// Configures getIt dependencies
@InjectableInit()
Future<void> configureDependencies() async => GetIt.instance.init();
