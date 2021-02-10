import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/account_model.dart';

class WithdrawalPage extends StatelessWidget {
  final List<Withdrawal> withdrawalData;

  const WithdrawalPage({Key key, @required this.withdrawalData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    WithdrawalTable tableData = WithdrawalTable(withdrawalData, context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Withdrawal",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: withdrawalData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_money,
                    color: Colors.white54,
                    size: 75,
                  ),
                  const SizedBox(height: 8),
                  AutoSizeText(
                    "No Recent Withdrawals",
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
              header: Text("Your Withdrawal"),
              source: tableData,
            ),
    );
  }
}

class WithdrawalTable extends DataTableSource {
  final List<Withdrawal> withdrawalData;

  final BuildContext context;

  WithdrawalTable(this.withdrawalData, this.context);

  @override
  DataRow getRow(int index) {
    final Withdrawal data = withdrawalData[index];
    return DataRow.byIndex(
      onSelectChanged: (val) {
        showDialog(
          context: context,
          builder: (context) {
            return WithdrawalDialog(
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
  int get rowCount => withdrawalData.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class WithdrawalDialog extends StatelessWidget {
  final Withdrawal data;

  const WithdrawalDialog({Key key, this.data}) : super(key: key);
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
                "Note: ${data.note}",
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
