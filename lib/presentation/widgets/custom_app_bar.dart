import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const CustomAppBar({
    required this.title,
    this.trailing,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          if (leading != null) leading!,
          Expanded(
            child: Text(
              title,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
