part of '../home_view.dart';

final class _ItemsWidget extends BaseWidget<HomeCubit, HomeState> {
  const _ItemsWidget();

  @override
  Widget build(BuildContext context, HomeCubit cubit, HomeState state) {
    return state.when(
      initial: () {
        return const SizedBox.shrink();
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      loaded: (HomeLoaded state) {
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: state.fakeData.length,
          itemBuilder: (context, index) {
            final item = state.fakeData[index];

            return Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 24.h,
                bottom: 130.h,
              ),
              child: Center(
                child: BlurContainer(
                  child: _MessageContainer(
                    item: item,
                    onLike: (item) => cubit.likeItem(item),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
