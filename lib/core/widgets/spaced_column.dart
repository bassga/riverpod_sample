import 'package:flutter/material.dart';
import 'package:reverpod_sample/core/design/app_theme_extension.dart';

class SpacedColumn extends StatelessWidget {
  const SpacedColumn({super.key, required this.children, this.gap});

  final List<Widget> children;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    final g = gap ?? context.space.inside;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(height: g),
          children[i],
        ],
      ],
    );
  }
}
