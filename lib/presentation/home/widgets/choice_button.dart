import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ChoiceButton({required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
