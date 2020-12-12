import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Wallet",
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
              Icons.account_balance_wallet,
              color: Colors.white54,
              size: 75,
            ),
            const SizedBox(height: 8),
            AutoSizeText(
              "Wallet Coming Soon",
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
