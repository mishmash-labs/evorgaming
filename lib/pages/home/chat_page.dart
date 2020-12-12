import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Chat",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.chat,
              color: Colors.white54,
              size: 75,
            ),
            const SizedBox(height: 8),
            AutoSizeText(
              "Chat Coming Soon",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
