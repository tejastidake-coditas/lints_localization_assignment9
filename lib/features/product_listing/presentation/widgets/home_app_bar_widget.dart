import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';

@RoutePage()
class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  void _onProfileImageTap(BuildContext context) {
    context.pushRoute(const ProfileDetailsRoute());
  }

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(AppLocalizations.of(context)!.appName,
            style: StyleConstants.appName),
        subtitle: Text(AppLocalizations.of(context)!.appTagLine,
            style: StyleConstants.appTagLine),
        trailing: InkWell(
          onTap: () => _onProfileImageTap(context),
          borderRadius: BorderRadius.circular(14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              TextConstants.defaultProfileImageText,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
