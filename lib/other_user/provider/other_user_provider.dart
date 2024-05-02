import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';
import 'package:mustad_test/common/provider/pagination_base_provider.dart';
import 'package:mustad_test/other_user/model/other_user_model.dart';
import 'package:mustad_test/other_user/repository/other_user_repository.dart';

final otherUserProvider = StateNotifierProvider<OtherUserStateNotifier, PaginationBase>((ref) {
  final repository = ref.watch(otherUserRepositoryProvider);
  return OtherUserStateNotifier(repository: repository);
});

class OtherUserStateNotifier extends PaginationProvider<OtherUserModel, OtherUserRepository> {
  OtherUserStateNotifier({required super.repository});
}