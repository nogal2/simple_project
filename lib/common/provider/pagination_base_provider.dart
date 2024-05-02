import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';
import 'package:mustad_test/common/repository/pagination_base_repository.dart';

class PaginationProvider<T extends PaginationModelItemBase, U extends IBasePaginationRepository<T>>
    extends StateNotifier<PaginationBase> {
  final U repository;
  final paginationThrottle = Throttle(
    const Duration(seconds: 3),
    initialValue: _PaginationInfo(),
    checkEquality: false,
  );
  int page = 1;

  PaginationProvider({
    required this.repository,
  }) : super(PaginationLoading()) {
    paginate();
    paginationThrottle.values.listen((state) {
      _throttledPagination(state);
    });
  }

  Future<void> paginate({
    int fetchCount = 10,
    bool fetchMore = false,
    bool forceRefetch = false,
  }) async {
    paginationThrottle.setValue(_PaginationInfo(
      fetchCount: fetchCount,
      fetchMore: fetchMore,
      forceRefetch: forceRefetch,
      // page: page,
    ));
  }

  _throttledPagination(_PaginationInfo info) async {
    try {
      final fetchCount = info.fetchCount;
      final fetchMore = info.fetchMore;
      final forceRefetch = info.forceRefetch;

      // 데이터를 가지고 있는 상태에서, 다음 페이지가 없을 때
      if (state is PaginationModel && !forceRefetch) {
        final pState = state as PaginationModel;
        if (pState.data.currentPage >= pState.data.totalPages) {
          return;
        }
      }

      final isLoading = state is PaginationLoading;
      final isRefetching = state is PaginationRefetching;
      final isFetchingMore = state is PaginationFetchingMore;

      // 데이터를 가지고 있는 상태에서, 추가 데이터를 가져오는 중일 때
      if(fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      if (fetchMore) {
        final pState = state as PaginationModel;
        state = PaginationFetchingMore(
          success: pState.success,
          message: pState.message,
          data: pState.data,
        );

        page++;
        // 페이지 파라미터 추가 로직
      }

      if (forceRefetch) {
        final pState = state as PaginationModel<T>;
        state = PaginationRefetching<T>(
          success: pState.success,
          message: pState.message,
          data: pState.data,
        );
        page = 1;
        // 페이지 파라미터 추가 로직
      }

      final resp = await repository.paginate();

      if (resp.success) {
        if(state is PaginationFetchingMore) {
          final pState = state as PaginationFetchingMore<T>;
          final newList = resp.data.content;
          state = resp.copyWith(
            message: resp.message,
            success: resp.success,
            data: PaginateBaseData(
              content: [...pState.data.content, ...newList],
              currentPage: resp.data.currentPage,
              size: resp.data.size,
              totalElements: resp.data.totalElements,
              totalPages: resp.data.totalPages,
            ),
          );
        } else {
          state = resp;
        }
      }
    } catch (e) {
      state = PaginationError(message: e.toString());
    }
  }
}

class _PaginationInfo {
  final int fetchCount;
  final bool fetchMore;
  final bool forceRefetch;

  _PaginationInfo({
    this.fetchCount = 20,
    this.fetchMore = false,
    this.forceRefetch = false,
  });
}
