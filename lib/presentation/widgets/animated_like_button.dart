import 'package:flutter/material.dart';
import 'package:flutter_demo/core/constants/assets_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final class AnimatedLikeButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLiked;
  const AnimatedLikeButton({required this.isLiked, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        child: SvgPicture.asset(
          isLiked ? AssetsConstants.heartFillIcon : AssetsConstants.heartIcon,
          key: ValueKey(isLiked),
          width: 24.r,
          height: 24.r,
        ),
      ),
    );
  }
}
