import 'package:flutter/material.dart';
import 'package:flutter_demo/core/constants/assets_constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  const CustomScaffold({
    required this.body,
    super.key,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetsConstants.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: ColoredBox(color: Colors.black.withOpacity(0.5)),
          ),
          body,
        ],
      ),
    );
  }
}
