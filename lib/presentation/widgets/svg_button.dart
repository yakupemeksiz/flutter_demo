import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final class SvgButton extends StatelessWidget {
  final String svgPath;
  final VoidCallback? onTap;
  const SvgButton({required this.svgPath, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SvgPicture.asset(
        svgPath,
        width: 20.r,
        height: 20.r,
      ),
    );
  }
}
