import 'package:flutter/material.dart';
import 'package:test_task/core/data/utilities/helper.dart';
import 'package:test_task/core/data/utilities/l10n/generated/l10n.dart';
import 'package:test_task/core/presentation/utilities/color/app_colors.dart';
import 'package:test_task/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:test_task/core/presentation/widgets/app_loading_widget.dart';

mixin BaseStateMixin<T extends StatefulWidget> on State<T> {
  bool _isLoaderShown = false;

  AppColors get colors => context.colors;

  TextTheme get fonts => context.fonts;

  Size get sizes => context.sizes;

  S get strings => context.strings;

  void showErrorDialog({
    required String? msg,
    String? title,
    String? buttonText,
    Function()? onPressed,
    // DialogIcons? icon = DialogIcons.error,
    bool isBarrierDismissible = true,
  }) {
    hideLoading();
    context.showErrorDialog(
      msg: msg?.nullIfEmpty ?? context.strings.somethingWentWrong,
      title: title,
      buttonText: buttonText,
      onPressed: onPressed,
      isBarrierDismissible: isBarrierDismissible,
    );
  }

  void showLoading() {
    if (_isLoaderShown) {
      return;
    }
    _isLoaderShown = true;
    showDialog(
      barrierDismissible: false,
      barrierColor: colors.black.withOpacity(.4),
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return const AppLoadingWidget();
      },
    );
  }

  void hideLoading() {
    if (_isLoaderShown) {
      Navigator.of(context, rootNavigator: true).pop();
      _isLoaderShown = false;
    }
  }

  void hideKeyboard() {
    context.hideKeyboard();
  }

  @override
  void dispose() {
    hideLoading();
    super.dispose();
  }
}
