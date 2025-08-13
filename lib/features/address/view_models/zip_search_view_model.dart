import 'package:reverpod_sample/address/domain/zip_address.dart';
import 'package:reverpod_sample/features/address/data/zip_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zip_search_view_model.g.dart';

@riverpod
class ZipSearchViewModel extends _$ZipSearchViewModel {
  @override
  AsyncValue<ZipAddress?> build() => const AsyncValue.data(null);

  Future<void> searchZip(String zipcode) async {
    final z = zipcode.replaceAll('-', '').trim();
    if (z.isEmpty) {
      state = const AsyncValue.data(null);
      return;
    }

    final zipRepository = ref.read(zipRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => zipRepository.fetchZipAddress(z));
  }

  void clear() => state = const AsyncValue.data(null);
}
