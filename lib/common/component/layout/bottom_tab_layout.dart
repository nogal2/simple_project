import 'package:flutter/material.dart';

class BottomTabLayout extends StatelessWidget {
  final List<Widget> children;

  const BottomTabLayout({required this.children, super.key,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
