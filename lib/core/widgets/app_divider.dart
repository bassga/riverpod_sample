import 'package:flutter/material.dart';
import 'package:reverpod_sample/core/design/tokens.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Divider(thickness: 1),
    );
  }
}
