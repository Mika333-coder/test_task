import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/data/models/assets/asset_model.dart';
import 'package:test_task/core/data/utilities/color_generator.dart';
import 'package:test_task/core/data/utilities/helper.dart';
import 'package:test_task/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:test_task/core/presentation/utilities/typography/text_theme.dart';

class AssetWidget extends StatelessWidget {
  const AssetWidget({super.key, required this.asset});

  final AssetModel asset;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56.sp,
          height: 56.sp,
          margin: 16.w.rightPadding,
          decoration: BoxDecoration(
              borderRadius: 18.sp.borderRadiusAll, color: ColorGenerator.randomColor(alpha: .1)),
        ),
        Text(
          asset.symbol ?? '-',
          style: context.fonts.titleStyle,
        ).expanded(),
        16.w.widthBox,
        Text(
          asset.price,
          style: context.fonts.titleStyle,
        ),
      ],
    ).paddingSymmetric(horizontal: 20.w, vertical: 14.h);
  }
}
