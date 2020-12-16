import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Balance",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.bottom,
                                  child: Icon(
                                    Icons.animation,
                                    size: 24,
                                    color: Color(0xFFDAA520),
                                  ),
                                ),
                                TextSpan(
                                  text: " 14",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.red.shade800,
                        child: Text("+ ADD COINS"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Earnings",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.bottom,
                                      child: Icon(
                                        Icons.animation,
                                        size: 24,
                                        color: Color(0xFFDAA520),
                                      ),
                                    ),
                                    TextSpan(
                                      text: " 14",
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 36,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.red.shade800,
                            child: Text("WITHDRAW"),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(thickness: 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "1 ",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.animation,
                                size: 14,
                                color: Color(0xFFDAA520),
                              ),
                            ),
                            TextSpan(
                              text: " = 1 PKR",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.bottom,
                                    child: Icon(
                                      Icons.animation,
                                      size: 24,
                                      color: Color(0xFFDAA520),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 14",
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Coins Deposited",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.bottom,
                                    child: Icon(
                                      Icons.animation,
                                      size: 24,
                                      color: Color(0xFFDAA520),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 14",
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Deposited Coins",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  "Transaction History",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                ),
              ),
              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   elevation: 0,
              //   color: Colors.black26,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Column(
              //               children: [
              //                 AutoSizeText(
              //                   "Number",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 SizedBox(height: 8),
              //                 AutoSizeText("1"),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 AutoSizeText(
              //                   "Message",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 SizedBox(height: 8),
              //                 AutoSizeText("Transaction SuccessFull"),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 AutoSizeText(
              //                   "Status",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 SizedBox(height: 8),
              //                 AutoSizeText("Complete"),
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 8),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Column(
              //               children: [
              //                 AutoSizeText(
              //                   "Amount",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 SizedBox(height: 8),
              //                 AutoSizeText("1 PKR"),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 AutoSizeText(
              //                   "Payment Method",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 SizedBox(height: 8),
              //                 AutoSizeText("Mobile Wallet(EasyPaisa)"),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 AutoSizeText(
              //                   "Date",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 SizedBox(height: 8),
              //                 AutoSizeText("13 Nov, 12:30PM"),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
