import 'package:flutter/material.dart';

class AnimationEnabler extends StatelessWidget {
  final Widget child;
  final bool isAnimationEnabled;

  const AnimationEnabler({
    required this.child,
    required this.isAnimationEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isAnimationEnabled
        ? AnimatedSize(
          duration: Duration(milliseconds: 650),
          curve: Curves.linear,
          child: child,
        )
        : SizedBox(child: child);
  }
}
