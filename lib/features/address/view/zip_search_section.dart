import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reverpod_sample/core/layout/section.dart';
import 'package:reverpod_sample/core/widgets/spaced_column.dart';
import 'package:reverpod_sample/features/address/view_models/zip_search_view_model.dart';

class ZipSearchSection extends HookConsumerWidget {
  const ZipSearchSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zipController = useTextEditingController(text: '');
    final zipState = ref.watch(zipSearchViewModelProvider);
    final zipNotifier = ref.read(zipSearchViewModelProvider.notifier);

    return Section(
      title: '郵便番号検索',
      child: SpacedColumn(
        children: [
          TextField(
            controller: zipController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '例: 100-0001',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              FilledButton(
                onPressed: zipState.isLoading
                    ? null
                    : () => zipNotifier.searchZip(zipController.text),
                child: Text(zipState.isLoading ? '検索中...' : '検索'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {
                  zipController.clear();
                },
                child: const Text('クリア'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          zipState.when(
            data: (zip) {
              if (zip == null) return const Text('結果なし');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('郵便番号: ${zip.zipcode}'),
                  Text('都道府県: ${zip.address1}'),
                  Text('市区町村: ${zip.address2}'),
                  Text('町域: ${zip.address3}'),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('エラー: $e'),
          ),
        ],
      ),
    );
  }
}
