import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CircleElevatedSvgButton extends StatelessWidget {
  final String svgPath;
  final double? radius;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const CircleElevatedSvgButton({
    required this.svgPath,
    required this.onPressed,
    this.radius,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        minimumSize: Size.square(radius ?? defaultRadius),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: SvgPicture.asset(svgPath, width: 20.r, height: 20.r),
    );
  }

  static double get defaultRadius => 32.r;
}
