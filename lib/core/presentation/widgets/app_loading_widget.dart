import 'package:flutter/material.dart';
import 'package:test_task/core/presentation/utilities/extensions/context_extensions.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(backgroundColor: color ?? context.colors.white),
    );
  }
}
