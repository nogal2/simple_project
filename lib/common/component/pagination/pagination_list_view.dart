import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mustad_test/common/component/layout/bottom_tab_layout.dart';
import 'package:mustad_test/common/model/pagination_base_model.dart';
import 'package:mustad_test/common/provider/pagination_base_provider.dart';

typedef PaginationModelItemBuilder<T extends PaginationModelItemBase> = Widget
    Function(BuildContext context, int index, T model);

class PaginationListView<T extends PaginationModelItemBase>
    extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginationProvider, PaginationBase> provider;
  final PaginationModelItemBuilder<T> itemBuilder;
  final double pagingEventHeight;

  const PaginationListView({
    required this.provider,
    required this.itemBuilder,
    this.pagingEventHeight = 60.0,
    super.key,
  });

  @override
  ConsumerState<PaginationListView> createState() =>
      _PaginationLayoutState<T>();
}

class _PaginationLayoutState<T extends PaginationModelItemBase>
    extends ConsumerState<PaginationListView> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    if (controller.offset >
        controller.position.maxScrollExtent - widget.pagingEventHeight) {
      ref.read(widget.provider.notifier).paginate(fetchMore: true);
    }
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);
    print('stateType: ${state.runtimeType}');
    if (state is PaginationLoading) {
      return const SizedBox();
    }

    if (state is PaginationError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            state.message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              ref.read(widget.provider.notifier).paginate(forceRefetch: true);
            },
            child: const Text('다시 시도'),
          ),
        ],
      );
    }

    final bState = state as PaginationModel<T>;
    final bList = bState.data.content;
    return BottomTabLayout(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.read(widget.provider.notifier).paginate(forceRefetch: true);
            },
            child: ListView.separated(
              separatorBuilder: (_, index) {
                return Container(
                  height: 1,
                  color: Colors.grey,
                );
              },
              itemCount: bList.length + 1,
              itemBuilder: (_, index) {
                if (index == bList.length) {
                  if (bState.data.currentPage < bState.data.totalPages) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }

                final model = bList[index];

                return widget.itemBuilder(context, index, model);
              },
            ),
          ),
        ),
      ],
    );
  }
}
