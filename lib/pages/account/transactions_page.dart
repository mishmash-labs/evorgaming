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
    TransactionTable tableData = TransactionTable(transactionData, context);

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
          : PaginatedDataTable(
              showCheckboxColumn: false,
              columns: [
                DataColumn(label: Text("#")),
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Status")),
              ],
              header: Text("Your Transactions"),
              source: tableData,
            ),
      // body: transactionData.isEmpty
      // ? Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const Icon(
      //           Icons.swap_horiz,
      //           color: Colors.white54,
      //           size: 75,
      //         ),
      //         const SizedBox(height: 8),
      //         AutoSizeText(
      //           "No Recent Transaction",
      //           style: const TextStyle(
      //             fontSize: 25,
      //             fontWeight: FontWeight.w400,
      //             color: Colors.white54,
      //           ),
      //         ),
      //       ],
      //     ),
      //   )
      //     : Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ListView.builder(
      //           itemCount: 2,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: Colors.black38,
      //                   borderRadius: BorderRadius.circular(8),
      //                 ),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       SizedBox(height: 4),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           AutoSizeText(
      //                             "Amount: "
      //                             "${transactionData[index].amount} PKR",
      //                             style: const TextStyle(
      //                               fontWeight: FontWeight.w500,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                           AutoSizeText(
      //                             DateFormat('d MMM, K:mma')
      //                                 .format(transactionData[index].updatedAt),
      //                             style: const TextStyle(
      //                               fontWeight: FontWeight.w400,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       SizedBox(height: 8),
      //                       AutoSizeText(
      //                         "Status: ${transactionData[index].status}",
      //                         style: const TextStyle(
      //                           fontWeight: FontWeight.w500,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       SizedBox(height: 8),
      //                       AutoSizeText(
      //                         "Message: ${transactionData[index].message}",
      //                         style: const TextStyle(
      //                           fontWeight: FontWeight.w500,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       SizedBox(height: 8),
      //                       AutoSizeText(
      //                         "Payment Method: ${transactionData[index].paymentMethod}",
      //                         style: const TextStyle(
      //                           fontWeight: FontWeight.w500,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       SizedBox(height: 4),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
    );
  }
}

class TransactionTable extends DataTableSource {
  final List<Transaction> transactionData;

  final BuildContext context;

  TransactionTable(this.transactionData, this.context);

  @override
  DataRow getRow(int index) {
    final Transaction data = transactionData[index];
    return DataRow.byIndex(
      onSelectChanged: (val) {
        showDialog(
          context: context,
          builder: (context) {
            return TransactionDialog(
              data: data,
            );
          },
        );
      },
      cells: <DataCell>[
        DataCell(Text('${data.id}')),
        DataCell(Text('${DateFormat('d MMM, K:mma').format(data.createdAt)}')),
        DataCell(Text('${data.status}')),
      ],
      index: index,
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => transactionData.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class TransactionDialog extends StatelessWidget {
  final Transaction data;

  const TransactionDialog({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Amount: "
                    "${data.amount} PKR",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  AutoSizeText(
                    DateFormat('d MMM, K:mma').format(data.updatedAt),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              AutoSizeText(
                "Status: ${data.status}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              AutoSizeText(
                "Message: ${data.message}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              AutoSizeText(
                "Payment Method: ${data.paymentMethod}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
