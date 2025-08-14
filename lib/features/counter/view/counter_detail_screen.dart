import 'package:flutter/material.dart';
import 'package:reverpod_sample/core/layout/app_page.dart';
import 'package:reverpod_sample/features/counter/view/sections/return_home_section.dart';

class CounterDetailScreen extends StatelessWidget {
  const CounterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      title: 'Detail',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Text('This is the detail screen'), ReturnHomeSection()],
      ),
    );
  }
}
