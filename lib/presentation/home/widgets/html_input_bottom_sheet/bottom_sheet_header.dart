import 'package:flutter/material.dart';
import 'package:html_previewer_app/app/navigation/app_navigator_extension.dart';
import 'package:html_previewer_app/common/dimensions.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;

  const BottomSheetHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 23),
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: Dimensions.iconL,
                    onPressed: () => context.appNavigator.pop(context),
                    icon: Icon(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      Icons.close,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
