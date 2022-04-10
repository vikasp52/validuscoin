import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validuscoin/network/database.dart';
import 'package:validuscoin/screens/profile/profile.dart';
import 'package:validuscoin/util/custom_colors.dart';

class BottomSheetContent extends StatefulWidget {
  BottomSheetContent({
    Key? key,
    required this.profileDataType,
    required this.value,
    required this.profile,
  }) : super(key: key);
  final ProfileDataType profileDataType;
  final String value;
  Profile? profile;

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final textEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      textEditController.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<MyDatabase>(context);
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: CustomColors.whiteColor,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      'Edit ${widget.profileDataType.name}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            (widget.profileDataType == ProfileDataType.email)
                ? const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Text(
                        'We\'ll send you an email to confirm you new email address',
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.whiteColor,
                        )),
                  )
                : const SizedBox(),
            Container(
              color: CustomColors.textFieldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: textEditController,
                    validator: validateTextField,
                    style: const TextStyle(
                      color: CustomColors.cardLabelColor,
                    ),
                    cursorColor: CustomColors.cardLabelColor,
                    decoration: InputDecoration(
                      label: Text(
                        'Enter ${widget.profileDataType.name}',
                        style: const TextStyle(
                          color: CustomColors.greyColor,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            MaterialButton(
              minWidth: double.maxFinite,
              color: CustomColors.tabSelectedColor,
              onPressed: () {
                if (textEditController.text.trim().isNotEmpty) {
                  saveData(myDatabase: database);
                  Navigator.pop(context);
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 13,
                ),
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? validateTextField(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Enter a valid data';
    } else if (widget.profileDataType == ProfileDataType.email &&
        !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  Future<void> saveData({
    required MyDatabase myDatabase,
  }) async {
    ProfilesCompanion? profilesCompanion;

    if (widget.profile == null) {
      if (widget.profileDataType == ProfileDataType.name) {
        profilesCompanion = ProfilesCompanion.insert(
          name: drift.Value(textEditController.text),
        );
      } else if (widget.profileDataType == ProfileDataType.email) {
        profilesCompanion = ProfilesCompanion.insert(
          email: drift.Value(textEditController.text),
        );
      } else {
        profilesCompanion = ProfilesCompanion.insert(
          address: drift.Value(textEditController.text),
        );
      }
    }

    if (widget.profileDataType == ProfileDataType.name) {
      widget.profile = widget.profile?.copyWith(
        name: textEditController.text,
      );
    } else if (widget.profileDataType == ProfileDataType.email) {
      widget.profile = widget.profile?.copyWith(
        email: textEditController.text,
      );
    } else {
      widget.profile = widget.profile?.copyWith(
        address: textEditController.text,
      );
    }

    try {
      if (widget.profile == null) {
        print('Insert is called');
        myDatabase.insertProfile(profilesCompanion!);
      } else {
        print('update is called');
        myDatabase.updateProfile(widget.profile!);
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
