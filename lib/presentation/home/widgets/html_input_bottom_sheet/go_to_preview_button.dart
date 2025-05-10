import 'package:flutter/material.dart';
import 'package:html_previewer_app/common/dimensions.dart';
import 'package:html_previewer_app/common/texts.dart';

class GoToPreviewButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoToPreviewButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.spacingM),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          Texts.goToPreview,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }
}
