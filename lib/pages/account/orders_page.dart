import 'package:auto_size_text/auto_size_text.dart';
import 'package:evorgaming/models/account_model.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key key, @required this.orderData}) : super(key: key);

  final List<Order> orderData;

  @override
  Widget build(BuildContext context) {
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
      body: orderData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white54,
                    size: 75,
                  ),
                  const SizedBox(height: 8),
                  AutoSizeText(
                    "No Recent Orders",
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
                itemCount: orderData.length,
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
                          AutoSizeText(
                              "Order Number " + orderData[index].id.toString()),
                          AutoSizeText(
                              "Subtotal: " + orderData[index].subTotal),
                          AutoSizeText(
                              "Shipping: " + orderData[index].shippingFee),
                          AutoSizeText("Total: " + orderData[index].total),
                          AutoSizeText(
                              "Status: " + orderData[index].reviewStatus),
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
