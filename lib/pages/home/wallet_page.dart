import 'package:auto_size_text/auto_size_text.dart';
import 'package:evorgaming/cubits/accountpage/account_cubit.dart';
import 'package:evorgaming/providers/userdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'withdraw_page.dart';

class WalletPage extends StatelessWidget {
  final AccountCubit accountCubit = AccountCubit();

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
      body: BlocBuilder(
        cubit: accountCubit
          ..loadAccount(Provider.of<UserData>(context, listen: false).userId),
        builder: (context, state) {
          if (state is AccountLoaded) {
            return Padding(
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
                                      text:
                                          " ${state.data.profileDetails.balance}",
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
                            onPressed: () async {
                              var userID =
                                  Provider.of<UserData>(context, listen: false)
                                      .userNumID;
                              var url =
                                  'https://evorgaming.com/qpp/congrunf/bvnd/gdjdh/hdvdnj/dbdbdjh/nbvdbd/Register/bbdh/mobile/app/payment/$userID/add/balance';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
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
                                          alignment:
                                              PlaceholderAlignment.bottom,
                                          child: Icon(
                                            Icons.animation,
                                            size: 24,
                                            color: Color(0xFFDAA520),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              " ${state.data.profileDetails.earning}",
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
                                onPressed: () {
                                  if (state.data.profileDetails.earning !=
                                          null &&
                                      state.data.profileDetails.earning != "0")
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WithdrawPage(),
                                      ),
                                    );
                                },
                                color: state.data.profileDetails.earning !=
                                            null &&
                                        state.data.profileDetails.earning != "0"
                                    ? Colors.red.shade800
                                    : Colors.grey,
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
                                        text:
                                            " ${state.data.profileDetails.coinDeposit}",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 24),
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
                                        text:
                                            " ${state.data.profileDetails.withdrawCoins}",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 24),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Withdrawn Coins",
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
                ],
              ),
            );
          } else if (state is AccountLoading) {
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.red.shade900,
                size: 50.0,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
