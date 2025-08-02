import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_view_model.g.dart';

@riverpod
class CounterViewModel extends _$CounterViewModel {
  @override
  int build() {
    return 0; // 初期値を0に設定
  }

  void increment() {
    state++; // カウントを1増やす
  }

  void decrement() {
    state--; // カウントを1減らす
  }
}
