part of '../home_view.dart';

final class _MessageContainer extends StatelessWidget {
  final FakeItemEntity item;
  final void Function(FakeItemEntity) onLike;

  const _MessageContainer({
    required this.item,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: context.textTheme.bodyLarge,
                ),
              ),
              Gap(8.w),
              Text(
                item.sendDate.toFormattedString(),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
          Gap(12.h),
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                item.message.join('\n') * 3,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ),
          Gap(12.h),
          AnimatedLikeButton(
            isLiked: item.isLiked,
            onTap: () => onLike(item),
          ),
          Gap(16.h),
          Center(
            child: SvgButton(
              svgPath: AssetsConstants.shareIcon,
              onTap: () {},
            ),
          ),
          Gap(24.h),
        ],
      ),
    );
  }
}
