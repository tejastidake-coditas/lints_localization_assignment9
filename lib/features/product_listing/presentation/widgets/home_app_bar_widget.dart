import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(AppLocalizations.of(context)!.appName,
            style: StyleConstants.appName),
        subtitle: Text(AppLocalizations.of(context)!.appTagLine,
            style: StyleConstants.appTagLine),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            TextConstants.defaultProfileImageText,
            height: 48,
            width: 48,
            fit: BoxFit.cover,
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
