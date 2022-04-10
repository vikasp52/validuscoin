import 'package:flutter/material.dart';
import 'package:validuscoin/network/database.dart';
import 'package:validuscoin/screens/profile/profile.dart';
import 'package:validuscoin/screens/profile/widget/widgets.dart';
import 'package:validuscoin/util/custom_colors.dart';

class CardData extends StatelessWidget {
  const CardData({
    Key? key,
    required this.label,
    required this.value,
    required this.profileDataType,
    required this.profile,
  }) : super(key: key);

  final String label;
  final String value;
  final ProfileDataType profileDataType;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: CustomColors.whiteColor,
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.9,
                      child: BottomSheetContent(
                        value: value,
                        profile: profile,
                        profileDataType: profileDataType,
                      ),
                    );
                  },
                );
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 18,
                  //color: CustomColors.whiteColor,
                  shadows: [
                    Shadow(
                      color: CustomColors.whiteColor,
                      offset: Offset(0, -2),
                    )
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          value,
          style: const TextStyle(
            color: CustomColors.greyColor,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
