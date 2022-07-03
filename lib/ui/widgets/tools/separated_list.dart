import 'package:flutter/material.dart';
import 'dart:math' as math;

class SeparatedWidgetList<E> extends StatelessWidget {
  const SeparatedWidgetList({
    Key? key,
    this.list,
    required this.builder,
    required this.separation,
    this.direction = Axis.vertical,
  }) : super(key: key);

  final List<E>? list;
  final Axis direction;
  final double separation;
  final Widget Function(E) builder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        computeActualChildCountForSeparated(list?.length ?? 0),
        (index) {
          int itemIndex = index ~/ 2;
          var item = list![itemIndex];

          if (index.isOdd) {
            if (direction == Axis.horizontal) {
              return SizedBox(width: separation);
            } else {
              return SizedBox(height: separation);
            }
          }

          return builder(item);
        },
      ),
    );
  }

  int computeActualChildCountForSeparated(int itemCount) {
    return math.max(0, itemCount * 2 - 1);
  }
}
