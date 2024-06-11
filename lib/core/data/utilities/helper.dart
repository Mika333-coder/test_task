import 'package:flutter/material.dart';

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);

  M also<M>(Function(M that) op) {
    op(this as M);
    return this as M;
  }

  K? nullableCast<K>() => this is K ? (this as K) : null;
}

extension ListExt<T> on List<T> {
  Map<K, List<D>> groupBy<K, D>(K Function(D) keySelector) {
    final result = <K, List<D>>{};
    forEach(
      (element) {
        element.nullableCast<D>()?.let(
          (it) {
            final key = keySelector(it);
            if (result.containsKey(key)) {
              result[key]?.add(it);
            } else {
              result[key] = [it];
            }
          },
        );
      },
    );
    return result;
  }

  List<R> mapIndexed<R>(R Function(int index, T element) toValue) {
    final List<R> result = [];

    for (int index = 0; index < length; index++) {
      result.add(toValue(index, this[index]));
    }

    return result;
  }

  T? getOrNull(int index) {
    if (length > index && index >= 0) {
      return this[index];
    }

    return null;
  }

  double sum(double Function(T element) value) {
    double sum = 0;
    forEach((element) {
      sum += value(element);
    });
    return sum;
  }

  bool all(bool Function(T element) expression) {
    for (final element in this) {
      if (!expression(element)) return false;
    }
    return true;
  }
}

extension StringExt on String? {
  String? get nullIfEmpty => this?.isNotEmpty == true ? this : null;

  Uri get uri => Uri.parse(this ?? '');
}

extension NumExt on num {
  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );

  SizedBox get widthBox => SizedBox(
        width: toDouble(),
      );

  Container horizontalDivider({
    Color color = Colors.black,
  }) =>
      Container(
        width: double.maxFinite,
        height: toDouble(),
        color: color,
      );

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());

  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());

  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());

  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());

  BorderRadiusGeometry get borderRadiusAll => BorderRadius.circular(toDouble());

  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());
}

extension WidgetExt on Widget {
  Expanded expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  Opacity setOpacity(double val) => Opacity(
        opacity: val,
        child: this,
      );

  Padding withPadding(EdgeInsets padding) => Padding(
        padding: padding,
        child: this,
      );

  SizedBox box({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  Center center() => Center(
        child: this,
      );

  Widget onClick(Function() onClick) => InkWell(
        onTap: onClick,
        child: this,
      );

  RotatedBox rotate(int quarterTurns) => RotatedBox(
        quarterTurns: quarterTurns,
        child: this,
      );

  Align align({AlignmentGeometry alignment = Alignment.center}) => Align(
        alignment: alignment,
        child: this,
      );

  AspectRatio aspectRatio(double ratio) => AspectRatio(
        aspectRatio: ratio,
        child: this,
      );
}
