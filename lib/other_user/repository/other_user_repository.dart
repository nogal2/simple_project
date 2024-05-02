import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mustad_test/common/dio/dio.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';
import 'package:mustad_test/common/repository/pagination_base_repository.dart';
import 'package:mustad_test/other_user/model/other_user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'other_user_repository.g.dart';

final otherUserRepositoryProvider = Provider<OtherUserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = dotenv.env['BASE_URL'];
  return OtherUserRepository(dio, baseUrl: baseUrl!);
});

@RestApi()
abstract class OtherUserRepository extends IBasePaginationRepository<OtherUserModel> {
  factory OtherUserRepository(Dio dio, {String baseUrl}) = _OtherUserRepository;

  @override
  @GET('/api/v1/users')
  Future<PaginationModel<OtherUserModel>> paginate();
}