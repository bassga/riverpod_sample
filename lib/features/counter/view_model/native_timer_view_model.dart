import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reverpod_sample/core/native/native_bridge.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'native_timer_view_model.g.dart';

@riverpod
class NativeTimerViewModel extends _$NativeTimerViewModel {
  StreamSubscription<String>? _timerSubscription;

  @override
  bool build() {
    return false; // 初期値はタイマーが停止している状態
  }

  Future<void> toggleTimer(BuildContext context) async {
    if (state) {
      await NativeBridge.stopTimer();
      await _timerSubscription?.cancel();
      _timerSubscription = null; // タイマーを停止
      state = false; // タイマーの状態を更新
    } else {
      _timerSubscription = NativeBridge.timerStream.listen((event) {
        // Handle timer event
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Timer event: $event')));
      });
      await NativeBridge.startTimer();
      state = true; // タイマーの状態を更新
    }
  }

  void dispose() {
    _timerSubscription?.cancel();
  }
}
