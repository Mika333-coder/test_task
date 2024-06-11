import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:test_task/core/data/utilities/bloc/bloc_factory.dart';
import 'package:test_task/core/data/utilities/l10n/generated/l10n.dart';
import 'package:test_task/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:test_task/core/presentation/utilities/l10n/locale_controller.dart';
import 'package:test_task/core/presentation/utilities/routes/app_routes.dart';
import 'package:test_task/core/presentation/views/main/main_screen.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
  });

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => BlocFactory(getIt: GetIt.instance),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleController(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            splitScreenMode: true,
            minTextAdapt: true,
            builder: (context, _) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.mainRoute,
                onUnknownRoute: (settings) => MaterialPageRoute(
                  builder: (_) => const MainScreen(),
                ),
                getPages: AppRoutes.rootRoutes,
                navigatorKey: Get.nestedKey(AppRoutes.rootNavigationKey),
                locale: context.read<LocaleController>().locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                theme: ThemeData(
                  fontFamily: 'SFProText',
                  highlightColor: context.colors.transparent,
                  splashColor: context.colors.transparent,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
