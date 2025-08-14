import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_sample/app/router.dart';
import 'package:reverpod_sample/core/design/app_theme_extension.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Riverpod MVVM Sample',
      routerConfig: router,
      theme: ThemeData(
        extensions: const [AppSpacingTheme(page: 24, section: 24, inside: 8)],
      ),
    );
  }
}
