import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'account/announcements_page.dart';
import 'account/orders_page.dart';
import 'account/profile_page.dart';
import 'account/settings_page.dart';
import 'account/statistics_page.dart';
import 'account/transactions_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "My Account",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ProfilePage();
                    },
                  );
                },
                icon: (Icon(Icons.person)),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        AutoSizeText("0"),
                        SizedBox(height: 8),
                        AutoSizeText(
                          "Balance",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        AutoSizeText("0"),
                        SizedBox(height: 8),
                        AutoSizeText(
                          "Won Balance",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatisticsPage(),
                ),
              );
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.stacked_bar_chart)),
            title: AutoSizeText(
              "Statistics",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnnouncementsPage(),
                ),
              );
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.announcement)),
            title: AutoSizeText(
              "Announcements",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersPage(),
                ),
              );
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.shopping_cart)),
            title: AutoSizeText(
              "Orders",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionsPage(),
                ),
              );
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.swap_horiz)),
            title: AutoSizeText(
              "Transactions",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SettingsPage();
                },
              );
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.person_add)),
            title: AutoSizeText(
              "Characters IDs",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () async {
              const url = 'https://evorgaming.com/page/Privacy-Policy';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent, child: Icon(Icons.policy)),
            title: AutoSizeText(
              "Privacy Policy",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () async {
              const url = 'https://evorgaming.com/page/Terms&Conditions';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent, child: Icon(Icons.notes)),
            title: AutoSizeText(
              "Terms & Conditions",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          ListTile(
            onTap: () async {
              const url = 'https://evorgaming.com/contact';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            leading: CircleAvatar(
                backgroundColor: Colors.transparent, child: Icon(Icons.help)),
            title: AutoSizeText(
              "FAQ / Support",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: OutlineButton(
                onPressed: () {},
                borderSide: BorderSide(color: Colors.red.shade800),
                highlightedBorderColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: AutoSizeText(
                  "Logout".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
