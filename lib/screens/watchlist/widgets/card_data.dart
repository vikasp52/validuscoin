import 'package:flutter/material.dart';
import 'package:validuscoin/util/custom_colors.dart';

class CardData extends StatelessWidget {
  const CardData({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: CustomColors.cardLabelColor,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: CustomColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
