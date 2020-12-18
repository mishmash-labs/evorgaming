import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/account_model.dart';

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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0,
                    color: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  AutoSizeText(
                                    "Number",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText((index + 1).toString()),
                                ],
                              ),
                              Column(
                                children: [
                                  AutoSizeText(
                                    "Message",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(transactionData[index].message),
                                ],
                              ),
                              Column(
                                children: [
                                  AutoSizeText(
                                    "Status",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(transactionData[index].status),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  AutoSizeText(
                                    "Amount",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(
                                      "${transactionData[index].amount} PKR"),
                                ],
                              ),
                              Column(
                                children: [
                                  AutoSizeText(
                                    "Payment Method",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(
                                      transactionData[index].paymentMethod),
                                ],
                              ),
                              Column(
                                children: [
                                  AutoSizeText(
                                    "Date",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  AutoSizeText(DateFormat('d MMM, K:ma').format(
                                      transactionData[index].updatedAt)),
                                ],
                              ),
                            ],
                          ),
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
