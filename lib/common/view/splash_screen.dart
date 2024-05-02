import 'package:flutter/material.dart';
import 'package:mustad_test/common/component/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  static String get routeName => 'splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text('스플래시 스크린'),
      ),
    );
  }
}
