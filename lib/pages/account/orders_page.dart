import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/account_model.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key key, @required this.orderData}) : super(key: key);

  final List<Order> orderData;

  @override
  Widget build(BuildContext context) {
    OrderTable tableData = OrderTable(orderData, context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Orders",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: PaginatedDataTable(
        showCheckboxColumn: false,
        columns: [
          DataColumn(label: Text("#")),
          DataColumn(label: Text("Date")),
          DataColumn(label: Text("Status")),
        ],
        header: Text("Your Orders"),
        source: tableData,
      ),
      // body: orderData.isEmpty
      //     ? Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const Icon(
      //               Icons.shopping_cart,
      //               color: Colors.white54,
      //               size: 75,
      //             ),
      //             const SizedBox(height: 8),
      //             AutoSizeText(
      //               "No Recent Orders",
      //               style: const TextStyle(
      //                 fontSize: 25,
      //                 fontWeight: FontWeight.w400,
      //                 color: Colors.white54,
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     : Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ListView.builder(
      //           itemCount: orderData.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(8.0),
      //               ),
      //               elevation: 0,
      //               color: Colors.black26,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Column(
      //                       children: [
      //                         AutoSizeText(
      //                           "Order Number",
      //                           style: const TextStyle(
      //                             fontWeight: FontWeight.w600,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         SizedBox(height: 8),
      //                         AutoSizeText(orderData[index].id.toString()),
      //                       ],
      //                     ),
      //                     Column(
      //                       children: [
      //                         AutoSizeText(
      //                           "Total Products",
      //                           style: const TextStyle(
      //                             fontWeight: FontWeight.w600,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         SizedBox(height: 8),
      //                         AutoSizeText(
      //                             orderData[index].qty.replaceAll(r"/@/", "")),
      //                       ],
      //                     ),
      //                     Column(
      //                       children: [
      //                         AutoSizeText(
      //                           "Status",
      //                           style: const TextStyle(
      //                             fontWeight: FontWeight.w600,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         SizedBox(height: 8),
      //                         AutoSizeText(orderData[index].status),
      //                       ],
      //                     ),
      //                     Column(
      //                       children: [
      //                         AutoSizeText(
      //                           "Total Amount",
      //                           style: const TextStyle(
      //                             fontWeight: FontWeight.w600,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         SizedBox(height: 8),
      //                         AutoSizeText(orderData[index].total),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
    );
  }
}

class OrderTable extends DataTableSource {
  final List<Order> orderData;
  final BuildContext context;

  OrderTable(this.orderData, this.context);

  @override
  DataRow getRow(int index) {
    final Order data = orderData[index];
    return DataRow.byIndex(
      onSelectChanged: (val) {
        // Navigator.pop(context);
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
  int get rowCount => orderData.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
