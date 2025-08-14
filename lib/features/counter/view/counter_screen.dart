// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reverpod_sample/core/layout/app_page.dart';
import 'package:reverpod_sample/core/widgets/app_divider.dart';
import 'package:reverpod_sample/features/address/view/zip_search_section.dart';
import 'package:reverpod_sample/features/counter/view/sections/counter_section.dart';
import 'package:reverpod_sample/features/counter/view/sections/native_demo_section.dart';

class CounterScreen extends HookConsumerWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppPage(
      title: 'Counter',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CounterSection(),
          AppDivider(),
          NativeDemoSection(),
          AppDivider(),
          ZipSearchSection(),
        ],
      ),
    );
  }
}
