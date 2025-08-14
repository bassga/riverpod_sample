import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reverpod_sample/core/layout/section.dart';
import 'package:reverpod_sample/core/widgets/spaced_column.dart';

class ReturnHomeSection extends StatelessWidget {
  const ReturnHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '戻るボタン',
      child: SpacedColumn(
        children: [
          const Text('This is the detail screen'),
          ElevatedButton(
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
            child: const Text('戻る'),
          ),
        ],
      ),
    );
  }
}
