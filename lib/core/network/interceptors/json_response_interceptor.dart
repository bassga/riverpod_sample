import 'dart:convert';

import 'package:dio/dio.dart';

class JsonResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (data is String) {
      final ct = response.headers.value('content-type')?.toLowerCase() ?? '';
      final looksJsonByCT =
          ct.contains('application/json') || ct.contains('text/json');
      final trimmed = data.trimLeft();
      final looksJsonByBody =
          trimmed.startsWith('{') || trimmed.startsWith('[');
      if (looksJsonByCT || looksJsonByBody) {
        try {
          response.data = jsonDecode(data);
        } catch (e) {
          // If parsing fails, log the error and keep the original response
          print('Failed to parse JSON response: $e'); // Log the error
        }
      }
    }
    handler.next(response);
  }
}
