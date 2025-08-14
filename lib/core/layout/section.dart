import 'package:flutter/material.dart';
import 'package:reverpod_sample/core/design/app_theme_extention.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final s = context.space;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: s.section),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(s.inside),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(width: s.inside),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
