import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reverpod_sample/features/counter/view_model/counter_view_model.dart';

class CounterSection extends ConsumerWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterViewModelProvider);
    final counter = ref.read(counterViewModelProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Counter Value: $count'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: counter.increment,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
