import 'package:flutter/material.dart';
import 'package:validuscoin/util/custom_colors.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 36,
        color: CustomColors.whiteColor,
      ),
    );
  }
}
