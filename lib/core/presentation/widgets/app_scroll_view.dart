import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  const AppScrollView({super.key, this.controller, this.child});

  final ScrollController? controller;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        )
      ],
    );
  }
}
