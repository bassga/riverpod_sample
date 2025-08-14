import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reverpod_sample/core/layout/section.dart';
import 'package:reverpod_sample/core/native/native_bridge.dart';
import 'package:reverpod_sample/core/widgets/spaced_column.dart';
import 'package:reverpod_sample/features/counter/view_model/native_timer_view_model.dart';

class NativeDemoSection extends ConsumerWidget {
  const NativeDemoSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning = ref.watch(nativeTimerViewModelProvider);
    final timer = ref.read(nativeTimerViewModelProvider.notifier);

    return Section(
      title: 'Native Demo',
      child: SpacedColumn(
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                final result = await NativeBridge.sayHello('Flutter');
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Native says: $result')));
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Error: $e')));
              }
            },
            child: const Text('Call Native Method'),
          ),
          ElevatedButton(
            onPressed: () => timer.toggleTimer(context),
            child: Text(isRunning ? 'Stop Native Timer' : 'Start Native Timer'),
          ),
          OutlinedButton(
            onPressed: () => context.push('/detail'),
            child: const Text('Go to Detail'),
          ),
        ],
      ),
    );
  }
}
