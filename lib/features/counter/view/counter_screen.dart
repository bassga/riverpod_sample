// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reverpod_sample/core/native/native_bridge.dart';
import 'package:reverpod_sample/features/counter/view_model/counter_view_model.dart';
import 'package:reverpod_sample/features/counter/view_model/native_timer_view_model.dart';
import 'package:reverpod_sample/features/counter/widgets/counter_value_text.dart';

class CounterScreen extends HookConsumerWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterViewModelProvider);
    final counter = ref.read(counterViewModelProvider.notifier);

    bool isRunning = ref.watch(nativeTimerViewModelProvider);
    final timerController = ref.read(nativeTimerViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterValueText(count),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: counter.increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/detail'),
              child: const Text('Go to Detail'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await NativeBridge.sayHello('Flutter');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Native says: $result')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Error: $e')));
                }
              },
              child: const Text('Call Native Method'),
            ),
            ElevatedButton(
              onPressed: () => timerController.toggleTimer(context),
              child: Text(
                isRunning ? 'Stop Native Timer' : 'Start Native Timer',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
