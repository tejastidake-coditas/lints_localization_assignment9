import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
import 'package:lints_localization_assignment9/main.dart';

@RoutePage()
class ProfileOptions extends StatefulWidget {
  const ProfileOptions({super.key});

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  Locale _selectedLocale = const Locale('en');

  void _openProfileDetails(BuildContext context) {
    context.pushRoute(const ProfileDetailsRoute());
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.profileOptions)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.chooseLanguage,
              style: StyleConstants.info.copyWith(color: ColorConstants.black),
            ),
            _buildLangOption(TextConstants.english, const Locale('en')),
            _buildLangOption(TextConstants.hindi, const Locale('hi')),
            _buildLangOption(TextConstants.spanish, const Locale('es')),
            const Divider(
              height: 32,
            ),
            GestureDetector(
              onTap: () => _openProfileDetails(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.profileDetails,
                    style: StyleConstants.info
                        .copyWith(color: ColorConstants.black),
                  ),
                  Image.asset(
                    TextConstants.smallRight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangOption(String title, Locale locale) => RadioListTile<Locale>(
        title: Text(title),
        value: locale,
        groupValue: _selectedLocale,
        onChanged: (Locale? value) {
          if (value != null) {
            setState(() {
              _selectedLocale = value;
            });
            MyApp.setLocale(context, value);
          }
        },
      );
}
