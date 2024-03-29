import 'package:flutter/material.dart';
import 'package:wassword/styles/colors.dart' as mcolors;
import 'package:wassword/styles/dimens.dart' as mdimens;

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.active,
    required this.callback,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData icon;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(mdimens.roundedCorner),
            color: active ? mcolors.colorEnabled : mcolors.colorDisabled,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Icon(
                  icon,
                  size: 24,
                  color:
                      active ? mcolors.colorTextDark : mcolors.colorTextLight,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: active
                          ? mcolors.colorTextDark
                          : mcolors.colorTextLight,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: active
                          ? mcolors.colorTextDark
                          : mcolors.colorTextLight,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
