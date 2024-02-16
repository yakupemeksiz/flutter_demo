part of '../home_view.dart';

final class _FloatingActions extends StatelessWidget {
  const _FloatingActions();

  static const _floatingActionText = 'Günün Şanslı Sayısı';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: StadiumElevatedTextButton(
            text: _floatingActionText,
            onPressed: () {},
          ),
        ),
        Gap(12.w),
        CircleElevatedSvgButton(
          svgPath: AssetsConstants.editIcon,
          onPressed: () {},
          radius: 48.r,
        ),
      ],
    ).symmetricHDefaultPadding;
  }
}
