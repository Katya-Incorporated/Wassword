import 'package:flutter/material.dart';
import 'package:wassword/styles/dimens.dart' as mdimens;

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback,
    required this.isMain,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback callback;
  final bool isMain;

  final double actionButtonSizeBig = 56;
  final double actionButtonSizeSmall = 44;

  @override
  Widget build(BuildContext context) {
    Color textColor = isMain
        ? Theme.of(context).colorScheme.onPrimaryContainer
        : Theme.of(context).colorScheme.onSecondaryContainer;
    Color backgroundColor = isMain
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.secondaryContainer;

    return GestureDetector(
      onTap: callback,
      child: Container(
        height: actionButtonSizeBig,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mdimens.roundedCorner),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: textColor,
              size: isMain
                  ? actionButtonSizeBig / 2
                  : actionButtonSizeSmall / 2.5,
            ),
            SizedBox(
              width: mdimens.defaultSpace,
            ),
            Text(
              text,
              style: TextStyle(fontSize: isMain ? 22 : 16, color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
