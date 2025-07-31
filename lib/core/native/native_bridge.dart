import 'package:flutter/services.dart';

class NativeBridge {
  static const _method = MethodChannel('com.example.native_bridge');
  static const _event = EventChannel('com.example/native_event');
  static Future<String?> sayHello(String name) async {
    return await _method.invokeMethod<String>('sayHello', {'name': name});
  }

  static Future<void> startTimer() async {
    await _method.invokeMethod('startTimer');
  }

  static Future<void> stopTimer() async {
    await _method.invokeMethod('stopTimer');
  }

  static Stream<String> get timerStream {
    return _event.receiveBroadcastStream().map((event) => event as String);
  }
}
