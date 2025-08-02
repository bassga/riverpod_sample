import 'package:flutter/material.dart';

class CounterValueText extends StatelessWidget {
  const CounterValueText(this.value, {super.key});
  final int value;

  @override
  Widget build(BuildContext context) {
    return Text('Counter Value: $value');
  }
}
