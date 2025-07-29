import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterViewModel extends AutoDisposeNotifier<int> {
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
