import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_sample/features/counter/view_model/counter_view_model.dart';

final counterProvider = NotifierProvider.autoDispose<CounterViewModel, int>(
  () => CounterViewModel(),
);
