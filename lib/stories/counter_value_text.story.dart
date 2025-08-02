import 'package:reverpod_sample/features/counter/widgets/counter_value_text.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final counterValueTextStory = Story(
  name: 'Counter Value Text',
  builder: (_) => const CounterValueText(42),
);
