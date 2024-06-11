import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/core/data/utilities/l10n/generated/l10n.dart';
import 'package:test_task/core/data/utilities/l10n/l10n_service.dart';
import 'package:test_task/core/presentation/utilities/assets/app_assets.dart';
import 'package:test_task/core/presentation/utilities/color/app_colors.dart';
import 'package:test_task/core/presentation/utilities/color/color_scheme.dart';
import 'package:test_task/core/presentation/utilities/typography/text_theme.dart';

extension BuildContextExt on BuildContext {
  AppColors get colors => Theme.of(this).colorScheme.appColors;

  TextTheme get fonts => Theme.of(this).textTheme;

  Size get sizes => MediaQuery.of(this).size;

  S get strings => AppLocale.of(this);

  AppAssets get assets => const AppAssets();

  void hideKeyboard() => FocusScope.of(this).unfocus();

  void showErrorDialog({
    required String msg,
    String? title,
    String? buttonText,
    Function()? onPressed,
    bool isBarrierDismissible = true,
  }) {
    showDialog(
      context: this,
      useSafeArea: false,
      barrierColor: colors.transparent,
      barrierDismissible: isBarrierDismissible,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title ?? '',
            style: context.fonts.titleStyle,
          ),
          content: Text(
            msg,
            style: context.fonts.bodyStyle,
          ),
        );
      },
    );
  }

  Future<T?> showBottomSheet<T>({
    required Widget child,
    Color? barrierColor,
    double? borderRadius,
  }) =>
      showModalBottomSheet<T>(
        context: this,
        barrierColor: barrierColor ?? colors.black.withOpacity(.5),
        enableDrag: true,
        useRootNavigator: true,
        backgroundColor: colors.white,
        isScrollControlled: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.sp),
        ),
        constraints: BoxConstraints(maxHeight: sizes.height * .88, minHeight: 0),
        builder: (context) {
          return child;
        },
      );
}
