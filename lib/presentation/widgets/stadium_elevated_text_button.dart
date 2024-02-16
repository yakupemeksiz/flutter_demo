import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StadiumElevatedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const StadiumElevatedTextButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: Size(100.w, 48.h),
      ),
      child: Text(text),
    );
  }
}
