import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        title: const Text(TextConstants.appName, style: StyleConstants.appName),
        subtitle: const Text(TextConstants.appTagLine,
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

  // return Padding(
  //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
  //   child: Row(
  //     children: [
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(TextConstants.appName, style: StyleConstants.appName),
  //           Text(TextConstants.appTagLine, style: StyleConstants.appTagLine),
  //         ],
  //       ),
  //       CircleAvatar(
  //         radius: 20,
  //         foregroundImage:
  //         NetworkImage(TextConstants.defaultProfileImageText),
  //       )
  //     ],
  //   ),
  // );

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
