import 'package:flutter/material.dart';
import 'package:flutter_demo/core/constants/assets_constants.dart';
import 'package:flutter_demo/core/constants/color_constants.dart';
import 'package:flutter_demo/core/utils/extensions/context_extensions.dart';
import 'package:flutter_demo/core/utils/extensions/date_time_extensions.dart';
import 'package:flutter_demo/core/utils/extensions/widget_extensions.dart';
import 'package:flutter_demo/core/view/base_view.dart';
import 'package:flutter_demo/core/widget/base_widget.dart';
import 'package:flutter_demo/domain/entities/faker_response_entity.dart';
import 'package:flutter_demo/inject.dart';
import 'package:flutter_demo/presentation/views/home/cubit/home_cubit.dart';
import 'package:flutter_demo/presentation/widgets/animated_like_button.dart';
import 'package:flutter_demo/presentation/widgets/blur_container.dart';
import 'package:flutter_demo/presentation/widgets/circle_elevated_svg_button.dart';
import 'package:flutter_demo/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_demo/presentation/widgets/custom_scaffold.dart';
import 'package:flutter_demo/presentation/widgets/stadium_elevated_text_button.dart';
import 'package:flutter_demo/presentation/widgets/svg_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

part './widgets/floating_actions.dart';
part './widgets/item_builder.dart';
part './widgets/massage_container.dart';

final class HomeView extends BaseView<HomeCubit, HomeState> {
  HomeView({super.key}) : super(cubit: getIt.call);

  @override
  Widget builder(BuildContext context, HomeCubit cubit) {
    return CustomScaffold(
      body: Column(
        children: [
          Gap(context.topPadding),
          const _HomeAppBar(),
          Gap(5.h),
          const Divider(thickness: 2, height: 0),
          const Expanded(child: _ItemsWidget()),
          // const CircularIconButton(),
        ],
      ),
      floatingActionButton: const _FloatingActions(),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();
  static const _title = 'Günlük Mesaj';
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: CircleElevatedSvgButton(
        onPressed: () {},
        svgPath: AssetsConstants.chevronLeftIcon,
      ),
      trailing: const _TrailingWidget(),
      title: _title,
    ).symmetricHDefaultPadding;
  }
}

class _TrailingWidget extends StatefulWidget {
  const _TrailingWidget();

  @override
  State<_TrailingWidget> createState() => _TrailingWidgetState();
}

class _TrailingWidgetState extends State<_TrailingWidget> {
  final globalKey = GlobalKey();

  OverlayEntry? overlayEntry;

  void toggleOverlay(Offset position) {
    overlayEntry ??= OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(child: GestureDetector(onTap: removeOverlay)),
            Positioned(
              left: position.dx,
              top: position.dy + CircleElevatedSvgButton.defaultRadius + 8.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleElevatedSvgButton(
                    svgPath: AssetsConstants.shareIcon,
                    backgroundColor: ColorConstants.menuBackgroundColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );

    if (overlayEntry!.mounted) {
      removeOverlay();
    } else {
      Overlay.of(context).insert(overlayEntry!);
    }
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CircleElevatedSvgButton(
      svgPath: AssetsConstants.moreIcon,
      key: globalKey,
      onPressed: () {
        final renderBox =
            globalKey.currentContext?.findRenderObject() as RenderBox?;

        if (renderBox == null) {
          return;
        }

        final position = renderBox.localToGlobal(Offset.zero);

        toggleOverlay(position);
      },
    );
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }
}
