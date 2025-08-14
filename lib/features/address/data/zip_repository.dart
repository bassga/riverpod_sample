import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_sample/address/domain/zip_address.dart';
import 'package:reverpod_sample/core/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zip_repository.g.dart';

@riverpod
ZipRepository zipRepository(Ref ref) => ZipRepository(ref.read(dioProvider));

class ZipRepository {
  ZipRepository(this._dio);
  final Dio _dio;
  CancelToken? _token;

  Future<ZipAddress?> fetchZipAddress(String zipcode) async {
    _token?.cancel();
    _token = CancelToken();
    final response = await _dio.get(
      '/search',
      queryParameters: {'zipcode': zipcode},
      cancelToken: _token,
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'HTTP ${response.statusCode} - ${response.statusMessage}',
      );
    }

    if (response.data == null) return null;
    final raw = response.data;
    final Map<String, dynamic> data = raw is String
        ? jsonDecode(raw) as Map<String, dynamic>
        : raw as Map<String, dynamic>;

    final results = data['results'] as List<dynamic>?;
    if (results == null || results.isEmpty) return null;

    final first = results.first as Map<String, dynamic>;
    return ZipAddress.fromJson(first);
  }
}
