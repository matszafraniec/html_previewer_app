import 'package:flutter/material.dart';
import 'package:html_previewer_app/common/dimensions.dart';
import 'package:html_previewer_app/common/texts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimensions.spacingM,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: Dimensions.spacingS,
          children: [
            Icon(
              Icons.html,
              size: Dimensions.iconL,
              color: Theme.of(context).primaryColor,
            ),
            Icon(
              Icons.remove_red_eye_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        Expanded(
          child: Text(
            Texts.appNameTitle,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
