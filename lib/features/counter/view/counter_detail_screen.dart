import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterDetailScreen extends StatelessWidget {
  const CounterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the detail screen'),
            const SizedBox(height: 16),
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
      ),
    );
  }
}
