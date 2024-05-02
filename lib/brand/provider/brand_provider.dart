import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mustad_test/brand/model/brand_model.dart';
import 'package:mustad_test/brand/repository/brand_repository.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';
import 'package:mustad_test/common/provider/pagination_base_provider.dart';

final brandProvider =
    StateNotifierProvider<BrandStateNotifier, PaginationBase>((ref) {
  final repository = ref.watch(brandRepositoryProvider);
  return BrandStateNotifier(repository: repository);
});

class BrandStateNotifier extends PaginationProvider<BrandModel, BrandRepository> {
  BrandStateNotifier({required super.repository});
}
