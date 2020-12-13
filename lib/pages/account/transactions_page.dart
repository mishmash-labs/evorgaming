import 'package:auto_size_text/auto_size_text.dart';
import 'package:evorgaming/models/account_model.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  final List<Transaction> transactionData;

  const TransactionsPage({Key key, @required this.transactionData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Transactions",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: transactionData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.swap_horiz,
                    color: Colors.white54,
                    size: 75,
                  ),
                  const SizedBox(height: 8),
                  AutoSizeText(
                    "No Recent Transaction",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: transactionData.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 0,
                    color: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AutoSizeText("Order Number " +
                              transactionData[index].id.toString()),
                          AutoSizeText(
                              "Subtotal: " + transactionData[index].accountNo),
                          AutoSizeText(
                              "Shipping: " + transactionData[index].amount),
                          AutoSizeText(
                              "Total: " + transactionData[index].message),
                          AutoSizeText("Status: " +
                              transactionData[index].paymentMethod),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
