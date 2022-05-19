import 'package:flutter/material.dart';
import 'package:wassword/styles/dimens.dart' as mdimens;

class AboutRow extends StatelessWidget {
  const AboutRow(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.callback})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.all(
            Radius.circular(mdimens.roundedCorner),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                icon,
                size: 32,
                color: textColor,
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
