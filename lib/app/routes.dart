import 'package:go_router/go_router.dart';
import 'package:reverpod_sample/features/counter/view/counter_detail_screen.dart';
import 'package:reverpod_sample/features/counter/view/counter_screen.dart';

final appRoutes = <GoRoute>[
  GoRoute(path: '/', builder: (_, __) => const CounterScreen()),
  GoRoute(path: '/detail', builder: (_, __) => const CounterDetailScreen()),
];
