import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/core/application.dart';
import 'package:test_task/core/data/db/app_database.dart';
import 'package:test_task/core/data/utilities/injection/injection.dart';
import 'package:test_task/core/data/utilities/log/logger_service.dart';
import 'package:test_task/core/data/utilities/storage/preferences_manager.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await PreferencesManager.initPreferences();
      await AppDatabase.initDatabase();
      await configureDependencies();
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ],
      );
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

      runApp(const Application());
    },
    (error, stackTrace) {
      LoggerService().e(
        'Error is $error, stack $stackTrace',
      );
    },
  );
}
