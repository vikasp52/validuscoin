import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validuscoin/network/database.dart';
import 'package:validuscoin/screens/profile/widget/widgets.dart';
import 'package:validuscoin/util/custom_colors.dart';
import 'package:validuscoin/widget/title.dart';

enum ProfileDataType { name, email, address }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final _cubit = context.read<ProfileCubit>();
    final database = Provider.of<MyDatabase>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          const ScreenTitle(
            title: 'Profile',
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.maxFinite,
            child: Card(
              color: CustomColors.cardColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 43,
                ),
                child: StreamBuilder(
                    stream: database.getProfileData(),
                    builder: (
                      context,
                      AsyncSnapshot<List<Profile>> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        Profile? profile;
                        final data = snapshot.data ?? [];

                        if (data.isNotEmpty) {
                          profile = data.first;
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardData(
                              label: 'Name',
                              profile: profile,
                              value: profile?.name ?? '',
                              //profile: profile,
                              profileDataType: ProfileDataType.name,
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            CardData(
                              label: 'Email',
                              profile: profile,
                              value: profile?.email ?? '',
                              profileDataType: ProfileDataType.email,
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            CardData(
                              label: 'Address',
                              profile: profile,
                              value: profile?.address ?? '',
                              profileDataType: ProfileDataType.address,
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
