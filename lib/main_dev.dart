import 'package:flutter/material.dart';
import 'package:reverpod_sample/storybook.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const StorybookApp());
}

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Storybook(stories: stories));
  }
}
