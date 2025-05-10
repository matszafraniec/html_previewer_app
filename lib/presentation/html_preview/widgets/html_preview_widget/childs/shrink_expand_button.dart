import 'package:flutter/material.dart';
import 'package:html_previewer_app/common/dimensions.dart';

class ShrinkExpandButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ShrinkExpandButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.paddingXS),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withAlpha(50),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
