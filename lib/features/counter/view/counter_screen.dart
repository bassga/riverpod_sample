import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reverpod_sample/features/counter/provider/counter_provider.dart';

class CounterScreen extends HookConsumerWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counter = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter Value: $count'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: counter.increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/detail'),
              child: const Text('Go to Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
