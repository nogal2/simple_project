import 'package:mustad_test/common/model/pagination_base_model.dart';

abstract class IBasePaginationRepository<T extends PaginationModelItemBase> {
  Future<PaginationModel<T>> paginate();
}