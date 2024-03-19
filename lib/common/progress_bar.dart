import 'package:flutter/material.dart';

import '../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required double progressValue,
  }) : _progressValue = progressValue;

  final double _progressValue;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: 0,
        end: _progressValue,
      ),
      builder: (context, value, _) => LinearProgressIndicator(
        color: kSecondaryColor,
        value: value,
        minHeight: 6,
      ),
    );
  }
}
