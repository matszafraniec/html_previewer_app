import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBox extends StatelessWidget {
  const BlurBox({super.key});

  static const _blurHeight = 30.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _blurHeight,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.6, sigmaY: 1.6),
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
