import 'package:flutter/material.dart';
import 'package:reverpod_sample/core/design/app_theme_extension.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final s = context.space;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: s.page),
          child: child,
        ),
      ),
    );
  }
}
