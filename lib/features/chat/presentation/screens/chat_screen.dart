import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.chat),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TextConstants.chatScreen),
          ],
        ),
      ),
    );
}
