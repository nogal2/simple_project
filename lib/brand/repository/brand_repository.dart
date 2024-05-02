import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mustad_test/brand/model/brand_model.dart';
import 'package:mustad_test/common/dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:mustad_test/common/model/pagination_base_model.dart';
import 'package:mustad_test/common/repository/pagination_base_repository.dart';
import 'package:retrofit/retrofit.dart';

part 'brand_repository.g.dart';

final brandRepositoryProvider = Provider<BrandRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = dotenv.env['BASE_URL'];
  return BrandRepository(dio, baseUrl: baseUrl!);
});


@RestApi()
abstract class BrandRepository extends IBasePaginationRepository<BrandModel> {
  factory BrandRepository(Dio dio, {String baseUrl}) = _BrandRepository;

  @override
  @GET('/api/v1/brands')
  Future<PaginationModel<BrandModel>> paginate();
}